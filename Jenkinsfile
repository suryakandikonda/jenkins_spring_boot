node('built-in') {
    stage ('checkout code') {
        checkout scm
    }
    stage ('Build') {
        bat "mvn clean install -DskipTests=true"
    }
    stage ('Archive Artifacts') {
        archiveArtifacts artifacts: 'target/*.war'
    }
    stage ('Deployment') {
       deploy adapters: [tomcat9(credentialsId: 'TomcatCreds', path:'', url: 'http://localhost:8081/')], contextPath: 'counterwebapp', war: 'target/*.war'
    }
}