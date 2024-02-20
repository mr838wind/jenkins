FROM jenkins/jenkins:lts

## jenkins website account
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

## debug install plugin: https://github.com/jenkinsci/docker#installing-custom-plugins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

## server account
USER root
RUN echo "root:admin!32" | chpasswd

# Install the latest Docker CE binaries: for Debian 12 bookworm (https://docs.docker.com/engine/install/debian/#installation-methods)
RUN apt-get update -qq && \
    apt-get install -qqy ca-certificates curl && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update -qq && \
    apt-get install -qqy docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
