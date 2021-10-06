# Deploy AWS Lambda to VPC with Terraform
## Code Repos:
 - https://github.com/atingupta2005/deploy-aws-lambda-with-terraform
 - https://github.com/atingupta2005/deploy-aws-lambda-to-vpc-with-terraform

## Write Lambda code
  - Let's create a standard Lambda function with Terraform and make sure it works first
  - The function will run a little snippet of Node.js code. Since we want to test the connectivity to the internet, the function will fetch some data from a 3rd party API.
  - Lambda Code:
      - https://github.com/atingupta2005/deploy-aws-lambda-with-terraform/tree/master/lambda

- The code is straightforward - it fetches a random fact from the API and returns it to the caller.

## Lambda Terraform module
- https://github.com/atingupta2005/deploy-aws-lambda-with-terraform/tree/master/terraform

## Deploy Lambda zero to AWS
```
git clone https://github.com/atingupta2005/deploy-aws-lambda-with-terraform
cd deploy-aws-lambda-with-terraform
cd terraform
terraform init
terraform apply
```

## Make sure Lambda works:
```
aws lambda invoke --function-name lambda-vpc-tf-lambda-function out.txt
```
```
cat out.txt
```

# VPC resources
- We will create a new VPC with 2 subnets. One is public (has a route to the Internet) and the other is private (does not have direct route out)
- The way to connect Lambda to VPC is by associating it with at least one private subnet
- That would give the function access to the resources in the VPC. But it won't have oubound connectivity yet. For that, a NAT component is required.

## Create VPC

```
# terraform/variables.tf

...

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR"
}
```

```
# terraform/main.tf

...

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.project}-vpc"
  }
}
```

## Create public subnet
```
# terraform/variables.tf

...

variable "subnet_public_cidr_block" {
  type        = string
  description = "Public subnet CIDR"
}
```

```
# terraform/terraform.tfvars

...

subnet_public_cidr_block  = "10.0.0.0/21"
```

```
# terraform/main.tf

...

resource "aws_subnet" "subnet_public" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_public_cidr_block
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project}-subnet-public"
  }
}
```

### Internet Gateway
- Each VPC can be associated with one (and only one) Internet Gateway. It is a managed highly available service from AWS which provides connectivity for public IP-enabled instances in the VPC to the Internet.
```
# terraform/main.tf

...

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-internet-gateway"
  }
}
```

### Public route table
 - What makes a public subnet public is a route to the Internet Gateway. Let's do just that, create a new route table with a single route (rule) to direct network requests to the Internet Gateway
 - We then associate the (public) route table with the (public) subnet
 - There's an implicit route allowing traffic within the VPC.
```
# terraform/main.tf

...

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.project}-route-table-public"
  }
}

resource "aws_route_table_association" "route_table_association_public" {
  subnet_id      = aws_subnet.subnet_public.id
  route_table_id = aws_route_table.route_table_public.id
}
```

### Elastic IP and NAT Gateway
- NAT Gateway is a network device that enables outbound connectivity for devices in the private network.
```
# terraform/main.tf

...

resource "aws_eip" "eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.internet_gateway]
  tags = {
    Name = "${var.project}-eip"
  }
}
```

```
# terraform/main.tf

...

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.subnet_public.id

  tags = {
    Name = "${var.project}-nat-gateway"
  }
}
```

## VPC with public and private subnets (NAT)
- https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Scenario2.html

## Create private subnet
- Private subnet is what we will associate Lambda with. The address space must be large enough to accomodate all IPs that will be assigned to ENIs when Lambda scales out.
```
# terraform/variables.tf

...

variable "subnet_private_cidr_block" {
  type        = string
  description = "Private subnet CIDR"
}
```

```
# terraform/terraform.tfvars

...

subnet_private_cidr_block = "10.0.8.0/21"
```

```
# terraform/main.tf

...

resource "aws_subnet" "subnet_private" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet_private_cidr_block
  map_public_ip_on_launch = false
  tags = {
    Name = "${var.project}-subnet-private"
  }
}
```

### Private route table
- Like in the public subnet, we need a route table with a route to direct traffic from the subnet to the NAT gateway
- By default, devices in subnets within a VPC can talk to each other
- In our case, it's Lambda in the private subnet making calls to the NAT Gateway in the public subnet.
```
# terraform/main.tf

...

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "${var.project}-route-table-private"
  }
}

resource "aws_route_table_association" "route_table_association_private" {
  subnet_id      = aws_subnet.subnet_private.id
  route_table_id = aws_route_table.route_table_private.id
}
```

## Create security resources
- In VPCs, the security controls available to you are Network Access Control Lists and Security Groups. These 2 are complementary and can be used individually as well as in combination.
- NACLs are stateless (for a given connection, you need to specify both inbound and outbound rules) and are associated with subnets.
- Security Groups are stateful (allowing inbound traffic to a port will automatically allow replies from that port). You associate devices (EC2 instances, Lambda) with security groups.
- Whenever a VPC is created, a NACL and a security group are created implicitly. You can take over these resources with aws_default_... Terraform resources. Ingress and egress rules provided below match what's created by AWS by default.

### NACL
- As with default settings, it allows all traffic on the network level.
```
# terraform/main.tf

...

resource "aws_default_network_acl" "default_network_acl" {
  default_network_acl_id = aws_vpc.vpc.default_network_acl_id
  subnet_ids             = [aws_subnet.subnet_public.id, aws_subnet.subnet_private.id]

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.project}-default-network-acl"
  }
}
```

### Security Group
- As with the default settings, it allows all outbound traffic and allows inbound traffic originating from the same VPC.
```
# terraform/main.tf

...

resource "aws_default_security_group" "default_security_group" {
  vpc_id = aws_vpc.vpc.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = ["127.0.0.1/32"]
  }

  tags = {
    Name = "${var.project}-default-security-group"
  }
}
```

## Add Lambda to the VPC
- Now that we have the VPC set up we can associate our existing Lambda function with the network.
- For that, we need to provide the VPC subnet and security group. AWS recommends adding Lambda to at least 2 subnets for high availability
- Combined with the recommendation to have multiple NAT gateways, you will need to create additional route tables too, to associate each private subnet with its dedicated NAT Gateway.

### VPC access policy
Since Lambda service will need to create ENIs (virtual network cards) in the private subnet, it needs additional IAM permissions. Those can be granted via AWSLambdaVPCAccessExecutionRole managed policy.
```
# terraform/main.tf

...

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment_lambda_vpc_access_execution" {
  role       = aws_iam_role.iam_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}
```

### Lambda function VPC config
- We configure Lambda to connect it to the private subnet. Also it will be subject to the Security Group rules.
```
# terraform/main.tf

...

resource "aws_lambda_function" "lambda_function" {
  ...

  vpc_config {
    subnet_ids         = [aws_subnet.subnet_private.id]
    security_group_ids = [aws_default_security_group.default_security_group.id]
  }
}
```

## Deploy AWS Lambda to VPC with Terraform
```
git clone https://github.com/atingupta2005/deploy-aws-lambda-to-vpc-with-terraform.git
cd terraform
```

```
terraform init
```

```
terraform apply -auto-approve
```

## Test
- To confirm everything is configured correctly, invoke the function again. If you're getting "timed out" error in Cloudwatch, likely something is wrong with the NAT Gateway configuration as the function cannot reach the API.
```
aws lambda invoke --function-name lambda-vpc-tf-lambda-function out.txt
```

```
cat out.txt
```
