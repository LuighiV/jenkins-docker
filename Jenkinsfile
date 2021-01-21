pipeline {
    agent { 
	label 'master' 
    } 
    stages {
        stage('Build image') {
            steps {
                echo 'Building image'
		docker.withRegistry('https://hub.docker.com/', 'docker-login') {
  			docker.build('jenkins-docker').push('latest')
		}  
            }
        }
    }
}
