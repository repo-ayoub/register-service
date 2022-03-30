node {

    stage("Git Clone") {
        git url: 'https://gitlab.com/ayoub.ben.idrissi/register-service.git',
        branch: 'develop',
        credentialsId: 'github_creds'
    }

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
        img.withRun("--name register-service_$BUILD_ID -p 8761:8761") { c ->
        sh 'docker ps'
        sh 'netstat -ntaup'
        sh 'sleep 30s'
        sh 'docker ps'
        }
    }


    post {
        always {
            cleanWs()
        }
    }

}