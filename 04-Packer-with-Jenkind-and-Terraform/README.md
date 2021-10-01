# Packer

## What is Packer

- Packer is an open-source VM image creation tool from Hashicorp
- It helps you automate the process of Virtual machine image creation on the cloud and on-prem virtualized environments.
- Whatever manual steps you perform to create a Virtual machine image can be automated through a simple Packer config template
- You declare the state of the VM image you need, and Packer will build it for you.

## Installing Packer
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer
packer version
```

## Building VM Image (AWS AMI) Using Packer
- Declare all the required VM configurations in an HCL (Hashicorp configuration language). Let’s call it the Packer template.
- To build the VM image, execute Packer with the config file.
- Packer authenticates the remote cloud provider and launches a server.
- Packer takes a remote connection to the server (SSH or Winrm).
- Then it configures the server based on the provisioner you specified in the Packer template
- Registers the AMI
- Deletes the running instance

### Packer Terminology
- The Template
  - The configuration file used to define what image we want built and how is called a template
  - Templates are given to commands such as packer build, which will take the template and actually run the builds within it, producing any resulting machine images.
  - A template has a set of keys configuring various components of Packer. The main keys within a template are Builders and Provisioners
- Builders
  - Responsible for creating machines and generating images from them for various platforms.
  - There are separate builders for each Cloud Provider, each with its own configuration.
- Provisioners
  - Provisioners are used to install and configure the machine image after booting
  - They prepare the system for use through for example installing the necessary packages


# Hands-On: Terraform-and-Packer-and-Jenkins
### Build script to use without Jenkins integration
```
chmod a+x build-and-launch.sh
sh build-and-launch.sh
```

### Build script to use with Jenkins
#### AWS Credentials
- To be able to upload to S3, you need to save your credentials in environment variables on your Jenkins:
  - AWS_DEFAULT_REGION=\<region of bucket\>
  - AWS_ACCESS_KEY_ID=\<aws id\>
  - AWS_SECRET_ACCESS_KEY=\<your access key\>

- To do that, just go to Jenkins - Manage Jenkins - Configure System - Global properties - Environment variables

#### Add Public Key to Jenkins Credentials
 - Add secret file in Manage Jenkins -> Manage Credentials -> Global -> Add Credentials -> Secret File

#### Create Jenkins Pipeline
 - Refer this repo in Jenkins
 - Select Configure
 - On the Configuration interface, under Build Environment, select Use secret text(s) or file(s).
 - Click Add -> Secret file. This creates a new Secret file binding.
 - Select Specific credentials, then from the drop-down menu below it select the secret file you would like to retrieve. Let's assume your secret file is stored under the filename id_rsa.pub
 - Assign to this secret file a variable e.g. id_rsa_pub
 - Now, under Build, click Add -> Execute shell
 - In the Command text area, add the following shell script:
```
rm -f $WORKSPACE/id_rsa.pub
cp $id_rsa_pub $WORKSPACE
```

 - Build script 2
```
ARTIFACT=`packer build -machine-readable packer-example.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "AMI_ID" { default = "'${AMI_ID}'" }' > amivar.tf
cat amivar.tf
terraform init
terraform apply -auto-approve -var 'key_pair="atingupta2005-terraform-packer"'  -var "PATH_TO_PUBLIC_KEY=$WORKSPACE/id_rsa.pub"
```

#### Test EC2 instance created from custom image
  - Take public IP of the new instance created
  - Open on browser to open nginx default page
  - Notice Custom Image created in EC2 Dashboard on AWS Console
