# Getting started with Pipeline
- Supports implementing and integrating continuous delivery pipelines into Jenkins

## Defining a Pipeline
- Both Declarative and Scripted Pipeline are DSLs
- Scripted Pipeline is written in a limited form of Groovy syntax.

- Declarative Pipeline
```
pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
```

- agent instructs Jenkins to allocate an executor
- echo writes simple string in the console output.

## In SCM
- Complex Pipelines are difficult to write and maintain within the classic UI’s Script text area of the Pipeline configuration page.
- To make this easier, your Pipeline’s Jenkinsfile can be committed to source control
- Jenkins can then check out your Jenkinsfile from source control as part of your Pipeline project’s build process and then proceed to execute your Pipeline


## Using environment variables
- BUILD_ID: The current build ID, identical to BUILD_NUMBER for builds created in Jenkins versions 1.597+

- BUILD_NUMBER: The current build number, such as "153"

- BUILD_TAG: String of jenkins-${JOB_NAME}-${BUILD_NUMBER}. Convenient to put into a resource file, a jar file, etc for easier identification

- BUILD_URL: The URL where the results of this build can be found (for example http://buildserver/jenkins/job/MyJobName/17/ )

- EXECUTOR_NUMBER: The unique number that identifies the current executor (among executors of the same machine) performing this build. This is the number you see in the "build executor status", except that the number starts from 0, not 1

- JAVA_HOME: If your job is configured to use a specific JDK, this variable is set to the JAVA_HOME of the specified JDK. When this variable is set, PATH is also updated to include the bin subdirectory of JAVA_HOME

- JENKINS_URL: Full URL of Jenkins, such as https://example.com:port/jenkins/ (NOTE: only available if Jenkins URL set in "System Configuration")

- JOB_NAME: Name of the project of this build, such as "foo" or "foo/bar".

- NODE_NAME: The name of the node the current build is running on. Set to 'master' for the Jenkins controller.

- WORKSPACE: The absolute path of the workspace

### How to use variables:
```
pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
    }
}
```

## Setting environment variables
- Accomplished differently depending on whether Declarative or Scripted Pipeline is used.

- Jenkinsfile (Declarative Pipeline)

```
pipeline {
    agent any
    environment {
        CC = 'clang'
    }
    stages {
        stage('Example') {
            environment {
                DEBUG_FLAGS = '-g'
            }
            steps {
                sh 'printenv'
            }
        }
    }
}
```

## Setup Docker with Jenkins Pipeline
- Install Jenkins Pluging - Docker, Docker Pipeline
- Install Docker on Master
- Add jenkins user to Docker group
- 	

```
sudo usermod -a -G docker  jenkins
```

## More Optional Pipeline Examples (Self Practicals)
- Refer: https://github.com/atingupta2005/jenkins-pipeline-examples.git
