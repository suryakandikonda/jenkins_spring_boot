FROM tomcat:11-jdk21
COPY target/jenkinspractice-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
