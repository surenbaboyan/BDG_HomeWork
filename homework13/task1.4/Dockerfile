FROM ubuntu
LABEL desc = "Apache on Ubutnu"
ENV TZ=Asia/Yerevan
RUN ln -snf "/usr/share/zoneinfo/$TZ" /etc/localtime
RUN echo "$TZ" > /etc/timezone
RUN apt-get update
RUN apt-get install -y apache2
COPY index.html /var/www/html
EXPOSE 80
EXPOSE 443
CMD /usr/sbin/apache2ctl -D FOREGROUND