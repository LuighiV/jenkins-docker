pipeline {
    agent { 
	label 'master' 
    } 
    stages {
        stage('Build image') {
            steps {
                echo 'Building image'
		script{
  			def image = docker.build('jenkins-docker')
		}
            }
        }
        stage('Build image') {
            steps {
                echo 'Pushing image'
		script{
			docker.withRegistry('https://hub.docker.com/', 'docker-login') {
  			     image.push('latest')
			}
		}
            }
        }
    }
}
