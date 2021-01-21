pipeline {
    environment {
        registry = "luighiv/jenkins-docker"
        registryCredential = 'docker-login'
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
	stage('Remove unused docker image') {
            steps{
 		echo 'Deleting unused image'
                sh "docker rmi $registry:latest"
            }
        }
    }
}
