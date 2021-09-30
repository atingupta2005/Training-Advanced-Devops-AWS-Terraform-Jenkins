# Packer

## What is Packer

- Packer is an open-source VM image creation tool from Hashicorp
- It helps you automate the process of Virtual machine image creation on the cloud and on-prem virtualized environments.
- Whatever manual steps you perform to create a Virtual machine image can be automated through a simple Packer config template
- You declare the state of the VM image you need, and Packer will build it for you.

## Packer Use Cases

- Golden Image Creation
  - With packer, you can template the configurations required for a golden VM image that can be used across organizations.

- Monthly VM Patching
  - You can integrate Packer in your monthly VM image patching pipeline.

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

## Build a Packer Image

### Define your Variables

- Let’s create a file variable.shand fill it with the following contents:

```
#!/bin/bash
export OS_USERNAME=xxx
echo "Please enter your OpenStack Password: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT
export OS_AUTH_URL="https://iam.xxx.com/v3"
export OS_REGION_NAME=xxx
export OS_TENANT_NAME=xxx
export OS_USER_DOMAIN_NAME=xxx
export SSH_USERNAME=xxx
export INSTANCE_NAME="packer-instance"
export SOURCE_ID=xxx
export FLAVOR=xxx
export NETWORK_ID=xxx
export FLOATING_ID=xxx
```

- OS_USERNAME and OS_PASSWORD represent your username and password to access your Cloud Provider Console.
- OS_REGION represent the region where your resources are going to be deployed
- OS_AUTH_URLrepresent the Identity and Access Management URL
- OS_TENANT_NAME represents your project name.
- OS_DOMAIN_NAME is your ID.
  - Both the OS_TENANT_NAME and OS_DOMAIN_NAME can be found at your Cloud Provider’s Console.
- SSH_USERNAMEspecifies the SSH login username of the private image to be created.
- INSTANCE_NAME specifies the temporary packer’s instance name.
- SOURCE_ID defines the ID of the public image on your Cloud Provider’s Console.
- FLAVOR defines the capacity of your machine in term of CPU and memory
- NETWORK_ID represents the ID of your network where your temporary packer instance gonna belong.
- FLOATING_ID is the ID of your created EIP that you gonna bind to your packer temporary instance in order to enable it to access internet and download packages
- The creation on your EIP can be done on your Cloud Provider’s Console.

### Build your Template

- After defining your variable.sh Let’s create the packer’s template template.json

```
{    
    "variables": {
        "os_username": "{{env `OS_USERNAME`}}",
        "os_password": "{{env `OS_PASSWORD`}}",
        "os_auth_url": "{{env `OS_AUTH_URL`}}",
        "os_region_name": "{{env `OS_REGION_NAME`}}",
        "os_tenant_name": "{{env `OS_TENANT_NAME`}}",
        "ssh_username": "{{env `SSH_USERNAME`}}",
        "os_domaine_name": "{{env `OS_USER_DOMAIN_NAME`}}",
        "instance_name": "{{env `INSTANCE_NAME`}}",
        "source_id": "{{env `SOURCE`}}",
        "os_flavor_id": "{{env `FLAVOR`}}",
        "os_network_id": "{{env `NETWORK_ID`}}",
        "os_floating_id": "{{env `FLOATING_ID`}}"
       },
       "builders": [
           {
            "type": "openstack",
            "identity_endpoint": "{{user `os_auth_url`}}",
            "tenant_name": "{{user `os_tenant_name`}}",
            "domain_name": "{{user `os_domaine_name`}}",
            "username": "{{user `os_username`}}",
            "password": "{{user `os_password`}}",
            "ssh_username": "{{user `ssh_username`}}",
            "region":  "{{user `os_region_name`}}",
            "image_name": "packer image",
            "instance_name": "{{user `INSTANCE_NAME`}}",
            "source_image": "{{user `source_id`}}",
            "availability_zone": "xxx",
            "use_blockstorage_volume": false,
            "flavor": "{{user `os_flavor_id`}}",
            "networks": ["{{user `os_network_id`}}"],
            "floating_ip": "{{user `os_floating_id`}}"
           }
       ],
       "provisioners": [
           {
            "type": "file",
            "source": "local-path/file",
            "destination": "destination-path/file"
           },
           {
            "script": "setup.sh",
            "type": "shell"
           },
           {
            "type": "shell",
            "inline": [
                "sudo apt-get update",
                "sudo apt-get upgrade"
               ]
           }
       ]
   }
```

- Shell Provisioner

```
#!/bin/sh

set -ex

if [ `id -u` -ne 0 ]; then
     sudo $0
    exit 0
fi

## your custom code below
apt-get update
apt-get --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
```

### Run Packer

- First you need to source your variable.sh script to setup the env variable, next build your image by running the packer build template.json command.

```
source variable.sh
packer build template.json
```
