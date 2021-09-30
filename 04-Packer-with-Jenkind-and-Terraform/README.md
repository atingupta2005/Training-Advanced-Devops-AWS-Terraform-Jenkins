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



## Packer Hands-on
  - Import Repo to your github account
    - https://github.com/atingupta2005/Packer-Terraform-Jenkins
  - Changes in repo code
    - key.tf
    - vars.tf
  - Refer repo imported in Jenkins
  - Build script
```
chmod a+x build-and-launch.sh
sh build-and-launch.sh
```
