# Installing Jenkins

## Enable swap space
sudo swapon -s
sudo fallocate -l 8G /swapfile
chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo su
echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
echo "vm.swappiness=10" >> /etc/sysctl.conf
exit
sudo swapon -s
free -m
sudo sysctl -p

## Removing Jenkins
sudo service jenkins stop
sudo apt-get remove --purge jenkins
sudo apt-get remove jenkins
sudo apt-get remove --auto-remove jenkins
sudo apt remove  -y jenkins
sudo snap remove jenkins

## Installing Jenkins on Ubuntu Linux
 - Checking and Installing Java
```
java -version
```

```
sudo apt update
```

```
sudo apt search openjdk
```

```
sudo apt install -y openjdk-11-jdk
java -version
```

-   Add the Jenkins Repository (If required)
```
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```


-   Installing Jenkins
```
sudo apt-get -y update
```

```
sudo apt install -y jenkins
```

```
systemctl status jenkins
```

```
sudo systemctl enable jenkins
sudo systemctl restart jenkins
```

- Open jenkins on browser:
  - http://<server-dns>:8080
  - http://vmubuntu-terraform-jenkins-aws.eastus.cloudapp.azure.com:8080

```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```

## Windows
 - Download from
  - https://www.jenkins.io/download/#downloading-jenkins
 - Run the setup


## Installing Python
```
sudo apt install python3
ls /usr/bin/python*
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
sudo update-alternatives --config python
```
