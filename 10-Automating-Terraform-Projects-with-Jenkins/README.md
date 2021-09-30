# Automating Terraform Projects with Jenkins

## Scripting Remote State Setup
- We should use remote tfstate file
- We will use s3 in our use case


## Steps
- Import [code repo](https://github.com/atingupta2005/Terraform-Jenkins-integration-AWS) in your github account
- Rename backend.tf.txt to backend.tf
- Do code changes in backend.tf to specify the s3 bucket name
- In Jenkins, install Plugin - Terraform
- Create Jenkins Pipeline project
