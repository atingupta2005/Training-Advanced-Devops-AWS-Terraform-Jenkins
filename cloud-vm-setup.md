- Connect to cloud VM using browser:
  - http://vmubuntu-terraform-jenkins-aws.eastus.cloudapp.azure.com:4200


- Install AWS CLI
```
sudo snap install aws-cli --classic
aws configure
#AWS Access Key ID [None]: <>
#AWS Secret Access Key [None]: <>
#Default region name [None]: us-east-1
#Default output format [None]: table/json/yaml
```

```
aws sts get-caller-identity
```


- Install Python and Jupyter Notebook
```
virtualenv ~/venv
source ~/venv/bin/activate
pip install jupyter
pip install bash_kernel
python -m bash_kernel.install
```

- Clone Git Repo
```
cd
git clone https://github.com/atingupta2005/Training-Advanced-Devops-AWS-Terraform-Jenkins
cd Training-Advanced-Devops-AWS-Terraform-Jenkins/
git pull
```

- Change Port number in below command and then run it.
```
cd
jupyter notebook --ip 0.0.0.0 --port 88?? --MultiKernelManager.default_kernel_name=bash
```
