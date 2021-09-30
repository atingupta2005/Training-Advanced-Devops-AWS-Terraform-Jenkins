# Provision AWS infrastructure using Terraform (By HashiCorp)
 - An example of web application logging customer data

- Use case of logging customer behavior data on web-application and will use Terraform to model the AWS infrastructure.

- Deploy using Terraform infrastructure definition and the source code for
    - An API based ingestion application system for websites and applications to push user interactions, such as user clicks on their website into database hosted on AWS
    - The data ingestion process is exposed with an API Gateway endpoint
    - The Amazon API Gateway processes the incoming data into an AWS Lambda during which the system validates the request using a Lambda Authorizer and pushes the data to a Amazon Kinesis Data Firehose
    - The solution leverages Firehose’s capability to convert the incoming data into a Parquet file (an open source file format for Hadoop) before pushing it to Amazon S3 using AWS Glue catalog.
    - Additionally, a transformational/consumer lambda does additional processing by pushing it to Amazon DynamoDB.

- The data hosted in Amazon S3 (Parquet file) and DynamoDB can be eventually used for generating reports and metrics depending on customer needs, such as monitor user experience, behavior and provide better recommendations on their website
- Per the needs for scale of the application you can use Amazon Kinesis and Amazon Kinesis Firehose Streams separately or in combination to scale, ingest and process your incoming data faster and cost efficiently
- For example, AWS Lambda now supports the Kinesis Data Streams (KDS) enhanced fan-out and HTTP/2 data retrieval features for Kinesis event sources
- The HTTP/2 data retrieval API improves the data delivery speed between data producers and Lambda functions by more than 65%
- This feature is available wherever AWS Lambda is available
- Refer to best practices on how to scale applications that ingest data via Kinesis Streams and other use cases for using AWS API Gateway with Lambda Authorizers.

### Overview of this implementation:
- Java source build – Provided code is packaged & build using Apache Maven
- Terraform commands are initiated (provided below) to deploy the infrastructure in AWS.
- An API Gateway, S3 bucket, Dynamo table, following Lambdas are built and deployed in AWS —
    - Lambda Authorizer – This lambda validates the incoming request for header authorization from API gateway to processing lambda.
    - ClickLogger Lamba – This lambda processes the incoming request and pushes the data into Firehose stream
    - Transformational Lambda – This lambda listens to the Firehose stream data and processes this to DynamoDB. In real world these lambda can more additional filtering, processing etc.,

- Once the data “POST” is performed to the API Gateway exposed endpoint, the data traverses through the lambda and Firehose stream converts the incoming stream into a Parquet file. We use AWS Glue to perform this operation.
- The incoming click logs are eventually saved as Parquet files in S3 bucket and additionally in the DynamoDB

### Prerequisites
 - Java
 - Apache Mave
 - Terraform
 - An AWS Account

### Steps Walkthrough
 - [Download](https://github.com/aws-samples/aws-ingesting-click-logs-using-terraform) the code and perform maven package for the Java lambda code.
 - Run Terraform command to spin up the infrastructure.
 - Use a tool like Postman or browser based extension plugin like “RestMan” to post a sample request to the exposed API Gateway endpoint
 - In AWS Console, confirm that process runs after the API Gateway is triggered. Notice the parquet file is created in S3 bucket and corresponding row is triggered in the DynamoDB Table.
 - Once the code is downloaded, please take a moment to see how Terraform provides a similar implementation for spinning up the infrastructure like that of AWS CloudFormation. You may use Visual Studio Code or your favorite choice of IDE to open the folder (aws-ingesting-click-logs-using-terraform).

### The Source Code
- The provided source code consists of the following major components
    - Terraform templates to build the infrastructure – aws-ingesting-click-logs-using-terraform/terraform/templates/
      - Java Lambda code as part of resources for Terraform to build – aws-ingesting-click-logs-using-terraform/source/clicklogger

### Deploying the Terraform template to spin up the infrastructure
- When deployed, Terraform creates the following infrastructure.
  - <img href=https://d2908q01vomqb2.cloudfront.net/0716d9708d321ffb6a00818614779e779925365c/2020/05/14/ingesting-click-logs-from-web-application.png></img>

```
git clone https://github.com/aws-samples/aws-ingesting-click-logs-using-terraform/
cd aws-ingesting-click-logs-using-terraform
cd source\clicklogger
mvn clean package
cd ..
cd ..
cd terraform\templates
terraform init
terraform plan
terraform apply --auto-approve
```

- Once the preceding Terraform commands complete successfully, take a moment to identify the major components that are deployed in AWS.
    - API Gateway
    - AWS Lambda
    - Amazon Kinesis Data Firehose
    - S3
    - Dynamo Table
    - CloudWatch – Log Groups

### Testing: post a sample request to the exposed API Gateway endpoint
  - In AWS Console, select API Gateway. Select click-logger-api
  - Select Stages on the left pane
  - Click dev > POST (within the /clicklogger route)
  - Copy the invoke Url. A sample url will be like this – https://z5xchkfea7.execute-api.us-east-1.amazonaws.com/dev/clicklogger
  - Use REST API tool like Postman or Chrome based web extension like RestMan to post data to your endpoint

- Add Header: Key Authorization with value ALLOW=ORDERAPP. This is the authorization key token used by the lambda. This can be changed in the lambda.tf. In external facing web applications, make sure to add additional authentication mechanism to restrict the API Gateway access

- Sample Json Request:
```
{
"requestid":"OAP-guid-12345-678910",
"contextid": "OAP-guid-1234-5678",
"callerid": "OrderingApplication",
"component": "login",
"action": "click",
"type": "webpage"
}
```

```
{
“requestid”:”OAP-guid-12345-678910″,
“contextid”: “OAP-guid-1234-5678”,
“callerid”: “OrderingApplication”,
“component”: “login”,
“action”: “click”,
“type”: “webpage”
}
```

- DynamoDB table —Select clickloggertable and view the items to see data.


### Clean up instructions
```
aws s3 rb s3://click-logger-firehose-delivery-bucket-<your-account-number> --force
terraform destroy –-auto-approve
```
