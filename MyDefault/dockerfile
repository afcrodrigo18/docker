# Base Image
	FROM amazonlinux:latest

# Maintainer
	LABEL description="Mi contenedor"

# Initial steps
        CMD ["/bin/bash"]

# Install  
        RUN yum update -y && \
            yum install -y bind-utils && \
            yum install -y wget && \
            yum install -y nano && \
            yum install -y vim && \
            yum install -y net-tools && \
            yum install -y openssh-clients && \
            yum install -y nc
