# The Base Image used to create this Image
FROM httpd:latest
MAINTAINER chenchuk (chenchuk@gmail.com)

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY server.key /usr/local/apache2/conf/server.key
COPY server.csr /usr/local/apache2/conf/server.csr
COPY server.crt /usr/local/apache2/conf/server.crt

RUN mkdir -p /usr/local/apache2/conf/sites/

EXPOSE 80
EXPOSE 443
CMD ["httpd", "-D", "FOREGROUND"]
