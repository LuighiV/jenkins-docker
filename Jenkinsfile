pipeline {
    environment {
        registry = "luighiv/jenkins-docker"
        registryCredential = 'dockerhub'
	docker_image = ''
    }
    agent { 
	label 'master' 
    } 
    stages {
        stage('Build image') {
            steps {
                echo 'Building image'
		script{
  			docker_image = docker.build('$registry')
		}
            }
        }
        stage('Publishing image') {
            steps {
                echo 'Pushing image'
		script{
			docker.withRegistry( '', registryCredential ) {
  				docker_image.push('latest')
     			}
		}
            }
        }
    }
}
