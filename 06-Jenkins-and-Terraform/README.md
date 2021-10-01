# Jenkins-and-Terraform
## What is Terraform?
- The infrastructure as a code offering from HashiCorp
- It is a tool for building, changing and managing infrastructure in a safe, repeatable way.

## Infrastructure as Code
- The process of managing infrastructure in a file or files rather than manually configuring resources in a user interface
- A resource in this instance is any piece of infrastructure in a given environment, such as a virtual machine, security group, network interface, etc.

## Install Terraform plugin
- Go to Manage Jenkins > Manage Plugins >Available > search Terraform
    - If you are already installed Terraform Plugin on your Jenkins It will display in the Installed section.
- Now we can see the Terraform option in the Build Environment section but we need to configure Terraform for Jenkins.

## Configure Terraform
- Go to Manage Jenkins > Global Tool Configuration > It will display Terraform on the list.

## Now let’s Create New Pipeline project to execute Terraform from Jenkins.

### Pipeline Script:
 - You can write your Pipeline code directly on Jenkins job.

### Pipeline Script From SCM:
- Pipeline supports fetching the DSL (Domain Specific Language) script from the SCM
- Typically called Jenkinsfile and located in the root of the project.

### AWS Credentials
- To be able to upload to S3, you need to save your credentials in environment variables on your Jenkins:
  - AWS_DEFAULT_REGION=\<region of bucket\>
  - AWS_ACCESS_KEY_ID=\<aws id\>
  - AWS_SECRET_ACCESS_KEY=\<your access key\>

- To do that, just go to Jenkins - Manage Jenkins - Configure System - Global properties - Environment variables



### Sample Project
- https://github.com/atingupta2005/Terraform-Jenkins-integration-AWS
