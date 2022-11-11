pipeline {
  agent any
  tools {
    
     jdk 'JAVA_HOME'
     maven 'M2_HOME'
    
  }
  stages {
    
    stage ('Check Tools Initializing') {
            steps {
                sh 'java --version'
                sh 'mvn --version'
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }
    stage('Cleaning the Project') {
      steps {
         sh 'echo "Clean the Project is processing ...."'
        sh 'mvn clean'
      }
    }
    
    stage ('Artifact construction') {
            steps {
                sh 'echo "Artifact construction is processing ...."'
                sh 'mvn -DskipTests package'
              
            }
            
        }
    stage('Junit Testing') {
      steps {
         sh 'echo "Junit Test is processing ...."'
        sh 'mvn  test'

      }
    }
	  
     stage('SonarQube analysis') {
		        steps {
		        withSonarQubeEnv('Sonarqube') {
		        sh 'mvn clean -DskipTests package sonar:sonar'
	                  }
	                }
	            }
	  
    stage('Docker build image') {
      steps {
         sh 'echo "Docker build image is processing ...."'
        sh 'docker build -t heladarguechi/achat .'

      }
    }
     stage('Docker login') {
      steps {
         sh 'echo "Docker login is processing ...."'
        sh 'docker login --username heladarguechi --password 98993295Azerty!'

      }
    }
    /*stage('Docker push') {
      steps {
         sh 'echo "Docker push is processing ...."'
        sh 'docker push heladarguechi/achat:latest'

      }
    }
    */
    
  }
  post {
    success { mail to: "darguechihela@gmail.com",
                    subject: "Build sucess",
                    body: "sucess"
             echo 'successful'}
    failure { mail to: "darguechihela@gmail.com",
                    subject: "Build failed",
                    body: "failed"
             echo 'failed'}
  }
}



