FROM centos:latest
RUN yum install telnet -y
RUN yum install iputils -y 
RUN mkdir -p /app
COPY Jenkinsfile /app
ENTRYPOINT [ "ping" ]
CMD [ "-c", "3", "8.8.8.8" ]
