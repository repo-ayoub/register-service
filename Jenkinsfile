pipeline {

    stages {
        stage("Maven Build") {
            steps {
                sh 'mvn --version'
                sh 'mvn clean install'
            }
        }
        stage("Maven Package") {
            steps {
                sh 'mvn package'
            }
        }

        def img = stage("Docker Build"){
            docker.build("xpxayoub/register-service:version-${env.BUILD_ID}", '.')
        }

        stage("Docker Run") {
            img.withRun("--name run-$BUILD_ID -p 8761:8761") { c->
            sh 'docker ps'
            sh 'netstat -ntaup'
            sh 'sleep 30s'
            sh 'curl 192.168.76.5:8761'
            sh 'docker ps'
            }
        }

    }

    post {
        always {
            cleanWs()
        }
    }

}