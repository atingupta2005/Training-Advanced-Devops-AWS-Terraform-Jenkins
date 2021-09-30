# Trainer Tasks

## Setup Shell in a Box (Access Ubuntu SSH/Shell/Console from Browser)
 - Refer: https://github.com/shellinabox/shellinabox
 - Refer: https://linoxide.com/web-remote-your-server/
```
sudo apt -y update
```

```
sudo apt -y install openssl
```

```
sudo apt -y install shellinabox
```

```
sudo /etc/init.d/shellinabox start
```

```
sudo sed -i 's/SHELLINABOX_ARGS="--no-beep"/SHELLINABOX_ARGS="--no-beep --disable-ssl"/g' /etc/default/shellinabox
```

```
sudo /etc/init.d/shellinabox restart
```

 - Open http://<ip-address>:4200
 - Note: Use Ctrl+Shift+V to paste

## Setup multiple users in Ubuntu
- For each participant, we need to setup login accounts
```
sudo groupadd docker
```

```
for ((i=1;i<=30;i++)); do
	export username="u$i"
	sudo useradd -g docker -m -p "p" $username;sudo usermod -aG sudo $username;echo $username:p | sudo /usr/sbin/chpasswd;sudo chown -R  $username:root /home/$username
done
```

- Comman softwares
```
sudo apt -y update
sudo apt -y install tree
```

- Create Python venv
```
sudo apt install -y python3-pip
pip3 -V
sudo apt install -y python3-virtualenv
virtualenv ~/venv
source ~/venv/bin/activate
```


- Install Jupyter Notebook
```
pip install jupyter
```

-  Clone Git Repo
```
cd
git clone https://gitlab.com/atin-trainings/Training-Advanced-Devops-AWS-Terraform-Jenkins.git
cd Training-Advanced-Devops-AWS-Terraform-Jenkins
git checkout am1
```

- Install notedown
```
source ~/venv/bin/activate
apt install -y notedown
```

- Convert Markdown files to Jupyter Notebook
```
source ~/venv/bin/activate
cd ~/Training-Advanced-Devops-AWS-Terraform-Jenkins
git checkout am1
find . -name  '*.md' -type f -exec sh -c  "notedown '{}' >  '{}.ipynb'" \;
```


- Start Jupyter server with different port
```
cd
jupyter notebook --ip 0.0.0.0 --port 8800 --MultiKernelManager.default_kernel_name=bash
```

- Install AWS CLI
```
sudo snap install aws-cli --classic
aws configure
#AWS Access Key ID [None]: <>
#AWS Secret Access Key [None]: <>
#Default region name [None]: us-east-2
#Default output format [None]: table/json/yaml
```

```
aws sts get-caller-identity
```

- Customize linux prompt
```
cat ~/.bashrc
echo 'export PS1="\e[0;31m\e[50m\u@\h\n\w \e[m\n$ "'   >> ~/.bashrc
cat ~/.bashrc
exit
```
