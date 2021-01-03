# The Base Image used to create this Image
FROM httpd:latest
MAINTAINER chenchuk (chenchuk@gmail.com)

COPY httpd.conf /usr/local/apache2/conf/httpd.conf
RUN mkdir -p /usr/local/apache2/conf/sites/

EXPOSE 80
CMD ["httpd", "-D", "FOREGROUND"]
