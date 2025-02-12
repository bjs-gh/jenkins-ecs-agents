FROM jenkins/jenkins:lts-jdk11

COPY jenkins-resources/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

COPY jenkins-resources/initialConfig.groovy /usr/share/jenkins/ref/init.groovy.d/initialConfigs.groovy
COPY jenkins-resources/jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
COPY jenkins-resources/slaveTestJob.xml /usr/share/jenkins/ref/jobs/slave-test/config.xml

ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false