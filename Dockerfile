FROM jenkins/jenkins:latest

#docker run -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins-terra-doc
USER root

# Install the latest version of Terraform
RUN apt-get update && \
    apt-get install -y wget unzip && \
    wget https://releases.hashicorp.com/terraform/1.0.4/terraform_1.0.4_linux_amd64.zip && \
    unzip terraform_1.0.4_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.0.4_linux_amd64.zip && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install docker 
RUN apt-get update && apt-get install -y docker.io && rm -rf /var/lib/apt/lists/*

USER jenkins