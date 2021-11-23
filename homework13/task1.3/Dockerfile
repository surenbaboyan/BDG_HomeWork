FROM centos
LABEL desc = "nginx in Centos"
RUN yum -y update
RUN yum install -y nginx
COPY index.html /usr/share/nginx/html
EXPOSE 80
EXPOSE 443
ENTRYPOINT [ "/usr/sbin/nginx", "-g", "daemon off;" ]