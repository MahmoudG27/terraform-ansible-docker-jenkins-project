#This Dockerfile for create customized Jenkins image and install in it Terraform & Ansible
FROM jenkins/jenkins:latest

USER root

# Install the latest version of Ansible
RUN apt-get update && \
    apt-get install -y ansible

# Install the latest version of Terraform
RUN wget https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_amd64.zip && \
    unzip terraform_1.0.3_linux_amd64.zip && \
    mv terraform /usr/local/bin/

USER jenkins