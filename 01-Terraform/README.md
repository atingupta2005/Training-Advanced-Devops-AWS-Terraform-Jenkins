# Terraform Hands-on
-   Export Access Key and Secret key
```
export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
```

-   Set Terraform base Path
```
bPTH='Training-Advanced-Devops-AWS-Terraform-Jenkins/01-Terraform'
```

## Deploying Infrastructure with Terraform
-   Set module path
```
mPTH='01 - Deploying Infrastructure with Terraform'
cd "$HOME/$bPTH/$mPTH";ls;pwd
```

### first_ec2
```
cd "$HOME/$bPTH/$mPTH"/1-first_ec2;ls;pwd
```

```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```


## Read, Generate, Modify Configurations
-   Set module path
```
mPTH='02 - Read, Generate, Modify Configurations'
cd "$HOME/$bPTH/$mPTH";ls;pwd
```

### attributes
```
cd "$HOME/$bPTH/$mPTH"/01-attributes;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### reference
```
cd "$HOME/$bPTH/$mPTH"/02-reference;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### variables
```
cd "$HOME/$bPTH/$mPTH"/03-variables;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### approach-to-variable-assignment
```
cd "$HOME/$bPTH/$mPTH"/04-approach-to-variable-assignment
```

#### Base Terraform Configuration (Before any modification)
```
cat base-config.tf.txt
```

#### Final Modified Terraform Configuration:
```
cat variables.tf
cat terraform.tfvars
cat main.tf
```

```
terraform init
```

#### Loading Variable Values from CLI
```
terraform plan -var="instancetype=t2.small"
```

#### Loading from custom tfvars file
```
terraform plan -var-file="custom.tfvars"
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### data-types
```
cd "$HOME/$bPTH/$mPTH"/05-data-types;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### Count-and-Count-Index
```
cd "$HOME/$bPTH/$mPTH"/06-Count-and-Count-Index;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### Conditional-Expressions
```
cd "$HOME/$bPTH/$mPTH"/07-Conditional-Expressions;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### Local-Values
```
cd "$HOME/$bPTH/$mPTH"/08-Local-Values;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### Terraform-Functions
```
cd "$HOME/$bPTH/$mPTH"/09-Terraform-Functions;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### dynamic-block
```
cd "$HOME/$bPTH/$mPTH"/10-dynamic-block;ls;pwd
```

```
cat before.tf.txt
```

```
cat dynamic-block.tf.txt
```

```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### modules
```
cd "$HOME/$bPTH/$mPTH"/11-modules;ls;pwd
```

```
cd projects
```

```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```


## Terraform Provisioners
-   Set module path
```
mPTH='03 - Terraform Provisioners'
cd "$HOME/$bPTH/$mPTH";ls;pwd
```

### remote-exec
```
cd "$HOME/$bPTH/$mPTH"/1-remote-exec;ls;pwd
```

-   Generate rsa ssh keys
```
if [ -f ~/.ssh/id_rsa ] ; then echo "already exist" ; else ssh-keygen -q -t rsa  -m PEM -N '' <<< ""$'\n'"y" 2>&1 >/dev/null ; fi
```

-   Import rsa public key in AWS Key Pair with name - <your-initials>-terraform
```
cat ~/.ssh/id_rsa.pub
```

```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### local-exec
```
cd "$HOME/$bPTH/$mPTH"/2-local-exec;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### provisioner-types
```
cd "$HOME/$bPTH/$mPTH"/3-provisioner-types;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### failure-behavior
```
cd "$HOME/$bPTH/$mPTH"/4-failure-behavior;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

## Terraform Modules & Workspaces
-   Set module path
```
mPTH='05 - Terraform Modules & Workspaces'
cd "$HOME/$bPTH/$mPTH";ls;pwd
```

### modules
```
cd "$HOME/$bPTH/$mPTH"/01-modules;ls;pwd
cd projects/A
```

```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

```
cd "$HOME/$bPTH/$mPTH"/01-modules;ls;pwd
cd projects/B
```

```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```


### terraform-registry
```
cd "$HOME/$bPTH/$mPTH"/02-terraform-registry;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### workspace
```
cd "$HOME/$bPTH/$mPTH"/03-workspace;ls;pwd
```
```
terraform init
```

### Terraform Workspace commands:
```
# Take help
terraform workspace -h
```

```
terraform workspace show
```

```
terraform workspace new dev
```

```
terraform workspace new prd
```

```
terraform workspace list
```

```
terraform workspace select dev
```

```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```


```
terraform workspace select prd
```

```
terraform plan
```


```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

## 06 - Remote State Management
-   Set module path
```
mPTH='06 - Remote State Management'
cd "$HOME/$bPTH/$mPTH";ls;pwd
```
### git-integration
```
cd "$HOME/$bPTH/$mPTH"/01-git-integration;ls;pwd
```
-   Create git repo on GitHub named - terraform_demo61285
-   Configure git on local
```
git config --global user.name "<Your Name>"
git config --global user.email "<Your Email ID>"
```
-   Clone git repo locally
```
mkdir ~/mygitrepos
cd ~/mygitrepos
pwd
```

```
git clone <repo-url>
```

```
cd terraform_demo61285
```

-   Copy required files and commit
```
cp "$HOME/$bPTH/$mPTH"/01-git-integration/main.tf .
ls .
ls ..
```

```
git add *
git commit -am "-"
pwd
```

```
# Run it on ubuntu terminal as it will prompt for credentials
# Need to create PAT using the steps as specified on URL:  https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token
git push https://atingupta2005%2Agmail.com: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@github.com/atingupta2005/terraform_demo61285.git --all
```

```
terraform init
```
```
terraform plan
```

```
pwd
```

```
#terraform apply -auto-approve
```

-   Again commit the changes - tfstate file, etc
```
git add *
git commit -am "-"
# Run it on ubuntu terminal as it will prompt for credentials
git push https://atingupta2005%2Agmail.com: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@github.com/atingupta2005/terraform_demo61285.git --all
```

```
#terraform destroy -auto-approve
```


### git-security-challenges
-   The password is saved in tfstate file
```
cat terraform.tfstate | grep password
# Note that password is stored in this file
```

### module-sources
#### Documentation Referred:
-   [https://www.terraform.io/docs/modules/sources.html#github](https://www.terraform.io/docs/modules/sources.html#github)

```
cd "$HOME/$bPTH/$mPTH"/02-module-sources;ls;pwd
```

#### GIT Sources

##### Example 1: Generic GIT Repository:
```
cd module1
terraform init
ll
tree .terraform
```

##### Example 2: Generic GIT Repository with Specific branch:
```
cd ../module2
terraform init
ll
tree .terraform
```

##### Example 3: GitHub Source:
```
cd ../module3
terraform init
ll
tree .terraform
```


### tf-gitignore
#### Documents Referred:
-   [GitHub gitignore repository](https://github.com/github/gitignore)

```
cd "$HOME/$bPTH/$mPTH"/03-tf-gitignore;ls;pwd
```

#### Step 1: Cloning Custom Repository:
```
mkdir -p ~/myrepos
cd ~/myrepos
git clone https://github.com/atingupta2005/tmp-repo.git tmp-repo2
cd tmp-repo2
pwd
ls
```
#### Step 2: Creating example tfvars file:
```
cat <<EOT > example.tfvars
username = "admin"
password = "password"
EOT
cat example.tfvars
```

#### Step 3: Apply the changes:
```
terraform init
terraform apply -auto-approve
```

```
rm .gitignore
git status
# Notice example.tfvars and terraform.tfstate also being shown as un-tracked
```

#### Step 4: Create a .gitignore file:
```
cat <<EOT > .gitignore
.terraform
*.tfvars
terraform.tfstate
EOT
ll
cat .gitignore
```

#### Step 5: Verify status:
```
git status
# Notice that ignored files are not to be committed
```

```
#terraform destroy -auto-approve
```

### remote-s3-backend
-   Create s3 bucket in AWS with name - <your-initials>-remote-backend
```
cd "$HOME/$bPTH/$mPTH"/04-remote-s3-backend;ls;pwd
```

-   Edit s3 bucket name in backend.tf
```
cat backend.tf
```

```
terraform init
```

-   Now run below command from 2 different terminals and notice that we can run from both terminals at a time. It might result in corruption of tfstate file and also an inconsistent state of our aws resources
```
pwd
```

```
# Run on terminal 1
terraform plan
```

```
# Run on terminal 2
terraform plan
```

-   Notice tfstate file is not in local folder
```
ls -al
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### remote-s3-backend-with-state-locking
```
cd "$HOME/$bPTH/$mPTH"/05-remote-s3-backend-with-state-locking;ls;pwd
```

-   Create a table named s3-state-lock in dynamodb with partition key column named - LockID
-   Edit dynamodb table name in backend.tf
    -   dynamodb_table = "s3-state-lock"
```
cat backend.tf
```

```
terraform init
```

-   Now run below command from 2 different terminals and notice that we can run only from one terminal at a time

```
pwd
```

```
# Run on terminal 1
terraform plan
```

```
# Run on terminal 2
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### state-management
```
cd "$HOME/$bPTH/$mPTH"/06-state-management;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

### State Management Commands:

#### List the Resource with State File:
```
terraform state list
```

#### Rename Resource within Terraform State
1.  Change the local name of EC2 resource from webapp to myec2.
1.  Run terraform plan to see the changes. It should destroy and recreate the EC2 instance.
1.  Change the local name of EC2 within the terraform state file with following command:

```
terraform state mv aws_instance.webapp aws_instance.myec2
```

#### Pull Current State file
```
terraform state pull
```

#### Remove Items from State file
```
terraform state rm aws_instance.myec2
```

#### Show Attributes of Resource from state file
```
terraform state show aws_iam_user.lb
```

```
#terraform destroy -auto-approve
```


### tf-import
```
cd "$HOME/$bPTH/$mPTH"/07-tf-import;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

-   Now add another security group to the ec2 instance on AWS portal
-   Since sg is added manually, we need to import its state in terraform

-   Command To Import Resource
```
terraform state rm aws_instance.myec2
terraform import aws_instance.myec2 <ec2-instance-id>
```

-   Now if we do a terraform plan, it will show that a resource to be changed
```
terraform plan
```

-   To avoid it, also add id of sg in main.tf. Then it will not show the resource to change
```
terraform plan
```


```
#terraform destroy -auto-approve
```

## Security Primer
-   Its better to use aws cli utility and configure it to store aws key and secret
-   We can then remove aws key and secret from the tf files
-   Install AWS CLI
```
sudo snap install aws-cli --classic
```
-   Configure aws cli
-   Refer: [https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
```
# Note: run below command on linux terminal
aws configure
#AWS Access Key ID [None]: <>
#AWS Secret Access Key [None]: <>
#Default region name [None]: us-east-1
#Default output format [None]: table/json/yaml
```

-   Check profile created
```
cat ~/.aws/credentials
```

```
aws sts get-caller-identity
```

-   Set module path
```
mPTH='07 - Security Primer'
cd "$HOME/$bPTH/$mPTH";ls;pwd
```

### credentials - works even if we don't have aws key in tf files
```
cd "$HOME/$bPTH/$mPTH"/01-credentials;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### multiple-providers-same-account
-   When we create any resource, its created in the region which we specify in provider block
-   We can create multiple providers each in different regions and even in different cloud providers

```
cd "$HOME/$bPTH/$mPTH"/02-1-multiple-providers-same-account;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### multiple-providers-multiple-accounts
-   In case we have different accounts, then we need to specify the profile attribute as well in the provisioner and create a profile on OS with that name.
-   Configure another aws account
```
# Note: run below command on linux terminal
aws configure --profile account02
```

```
cat ~/.aws/credentials
```

```
cd "$HOME/$bPTH/$mPTH"/02-2-multiple-providers-multiple-accounts;ls;pwd
```
```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```

### sensitive
```
cd "$HOME/$bPTH/$mPTH"/03-sensitive;ls;pwd
```
-   We have set sensitive parameter to true
```
cat main.tf
```

```
terraform init
```
```
terraform plan
# Sensitive information will not be shown
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```


## Terraform Cloud & Enterprise Capabilities
-   Manages the terraform runs in a consistent and reliable environment
-   It provides various features - Access Control, Private Registry for sharing modules, policy control etc.
-   Solves the issue of having different tf versions by different teams members
-   It can be resolved if using tf cloud because we have a consistent environment in tf cloud
-   Provides cost estimation, policy check, manual approval, logging of the plans
-   All teams members will be able to view the run list in the workspace in tf cloud
-   Multiple users will be able to comment of the specific run
-   State file is also maintained
-   Have options to add variables which can be used in tf files
-   We can also publish the modules in tf cloud
-   Can integrate with VCS - GITHUB, Bit bucket etc. to store tf code
-   Can create Sentinel policies - verify if instances have tags or not

### Create Terraform cloud account
-   Create a free cloud account
    -   [https://app.terraform.io/signup/account](https://app.terraform.io/signup/account)

-   Create Terraform Organization
    -   Organization Name: demo-<your-initials>-org

-   Create a new workspace

-   Create a new GitHub repo as private

-   Open GitHub account settings from top right

-   Integrate with GitHub by following the instruction given on the link on current TF Cloud page

-   Add a new file to new GitHub repo - ec2.tf
```
resource "aws_instance" "myec2" {
  ami           = "ami-5b41123e"
  instance_type = "t2.micro"
}
```

-   Create a new workspace in tf cloud and connect with GitHub repo

-   Configure environment variable in workspace
    -   AWS_ACCESS_KEY_ID
    -   AWS_SECRET_ACCESS_KEY
    -   AWS_DEFAULT_REGION

-   Go back to tf repo and in tf cloud and Click Queue a plan from top right

-   Click Confirm&Apply

-   Verify the  Run, States, Settings etc of the repo

-   Click Settings->Destruction and Deletion to Queue Destroy Plan

-   Open Organization -> and from top right click Upgrade Now and opt for 30 days free plan

-   Notice other features are available

-   Queue plan again and notice Cost Estimation stage

-   Set module path
```
mPTH='08 - Terraform Cloud & Enterprise Capabilities'
cd "$HOME/$bPTH/$mPTH";ls;pwd
```

### sentinel-policy
-   An embedded policy-as-code framework
-   Enables fine grained logic based policy decisions
-   Workflow:  plan -> Sentinel Policy  -> apply
-   Paid feature
-   To implement, create and associate policy with policy set and then associate policy set with workspace
-   Open Organization settings
-   Open Policies and Policy sets from left menu
-   Create a new Policy Set -> No VCS connection, All workspaces
-   Create policy -> Enforcement modes: Hard mandatory
-   Add policy code
```
import "tfplan"

main = rule {
  all tfplan.resources.aws_instance as _, instances {
    all instances as _, r {
      (length(r.applied.tags) else 0) > 0
    }
  }
}
```
-   Select policy set and create policy
-   Open workspaces
-   Queue plan
-   Notice there is one more tab now - Policy Check
-   Policy check is failed

### Remote Backends
-   Stores tf states
-   May be used to run operations in tf cloud
-   Execution is done in tf cloud but logs are streamed to local terminal
-   No need to store secret keys locally
-   If repo is tf cloud is connected with GitHub then we can not do - terraform apply

### Documentation Referred:
-   [https://www.terraform.io/docs/backends/types/remote.html](https://www.terraform.io/docs/backends/types/remote.html)

```
cd "$HOME/$bPTH/$mPTH"/02-remote-backend;ls;pwd
```
-   Update Organization name in file
    -   backend.hcl

-   Update access_key and secret_key in
    -   main.tf

-   Generate API Token from Organization Settings -> API Token

### CLI Commands used
-   Run these commands on linux console
```
terraform login
```

```
terraform init -backend-config=backend.hcl
````

```
terraform init
```
```
terraform plan
```

```
#terraform apply -auto-approve
```

```
#terraform destroy -auto-approve
```
