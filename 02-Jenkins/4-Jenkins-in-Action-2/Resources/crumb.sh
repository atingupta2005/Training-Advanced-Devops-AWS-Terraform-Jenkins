crumb=$(curl -u "jenkins:123456" -s 'http://localhost:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,":",//crumb)')
echo $crumb
curl -u "jenkins:123456" -H "$crumb" -X POST http://localhost:8080/job/1-using-jenkins/build?delay=2sec
curl -u "jenkins:123456" -H "$crumb" -X POST http://vmubuntu-terraform-jenkins-aws.eastus.cloudapp.azure.com:8080/job/12-Add-parameters-to-Job/buildWithParameters?NAME=Atin
