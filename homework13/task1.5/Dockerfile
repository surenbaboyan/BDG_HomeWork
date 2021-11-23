FROM centos
LABEL desc = "httpd on Centos"
RUN yum -y update
RUN yum install -y httpd
COPY index.html /var/www/html
EXPOSE 80
EXPOSE 443
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
