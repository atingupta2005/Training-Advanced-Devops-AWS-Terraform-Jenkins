# Automating Terraform Projects with Jenkins

## Scripting Remote State Setup
- We should use remote tfstate file
- We will use s3 in our use case


## Steps
- Import [code repo](https://github.com/atingupta2005/Terraform-Jenkins-integration-AWS) in your github account
  - Imported Repo:
      - https://github.com/atingupta2005/Terraform-Beckend-Jenkins-integration-AWS
- Rename backend.tf.txt to backend.tf
- Do code changes in backend.tf to specify the s3 bucket name
- Create Jenkins Pipeline project
- There are 2 pipeline to use - jenkinsfile and jenkinsfile-destroy
