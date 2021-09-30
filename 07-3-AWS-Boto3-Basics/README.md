# AWS-Boto3-Basics
## Preparing The Environment for Development
### Create AWS account
 - Get Access key and secret access key

### Tools and Environment
 - Install AWS CLI
```
sudo snap install aws-cli --classic
```

 - Configure AWS CLI
```
aws configure
```

- Verify AWS configuration
```
aws sts get-caller-identity
```

 - Install Python - to interact with AWS
```
sudo apt -y update
sudo apt install -y python3-pip
pip3 -V
sudo apt install -y python3-virtualenv
```

 - Python Virtual Environment, Install Jupyter Notebook and Boto3 Python library
    - Refer and run [setup-env.sh](setup-env.sh)
