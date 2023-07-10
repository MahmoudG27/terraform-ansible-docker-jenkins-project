#This Dockerfile for create customized Jenkins image and install in it Terraform & Ansible
FROM jenkins/jenkins:latest

USER root

# Install dependencies for Terraform and Ansible
RUN apt-get update && \
    apt-get install -y wget unzip git python3-pip && \
    pip3 install ansible && \
    wget https://releases.hashicorp.com/terraform/1.0.3/terraform_1.0.3_linux_amd64.zip && \
    unzip terraform_1.0.3_linux_amd64.zip && \
    mv terraform /usr/local/bin/terraform && \
    rm terraform_1.0.3_linux_amd64.zip

USER jenkins