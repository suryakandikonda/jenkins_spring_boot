// node('built-in') {
//     stage ('checkout code') {
//         checkout scm
//     }
//     stage ('Build') {
//         bat "mvn clean install -DskipTests=true"
//     }
//     stage ('Archive Artifacts') {
//         archiveArtifacts artifacts: 'target/*.war'
//     }
//     stage ('Deployment') {
//        deploy adapters: [tomcat9(credentialsId: 'TomcatCreds', path:'', url: 'http://localhost:8081/')], contextPath: 'counterwebapp', war: 'target/*.war'
//     }
// }

pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            checkout scm
        }
        stage('Build WAR') {
            steps {
                bat "mvn clean install -DskipTests=true"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('testspringbootapp:latest')
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop any existing container
                    bat 'docker stop spring-tomcat || echo No container to stop'
                    bat 'docker rm spring-tomcat || echo No container to remove'
                    // Run new container
                    bat 'docker run -d --name spring-tomcat -p 8081:8080 testspringbootapp:latest'
                }
            }
        }
    }
}
