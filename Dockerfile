FROM ubuntu:trusty
MAINTAINER Juha Koskiaho <dev.jkoskiaho@outlook.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to NZ
#RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list

#Install Ansible
RUN apt-get update -qy && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible

# Copy baked in playbooks
COPY ansible /ansible

# Add colume for Ansible playbooks
VOLUME /ansible
WORKDIR /ansible

# ENTRYPOINT
ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]

