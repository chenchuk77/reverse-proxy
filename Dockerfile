# The Base Image used to create this Image
FROM httpd:latest
MAINTAINER chenchuk (chenchuk@gmail.com)

RUN mkdir -p /usr/local/apache2/conf/sites/
RUN apt-get update && \
    apt-get install -y python3

COPY httpd.conf       /usr/local/apache2/conf/httpd.conf
COPY server.key       /usr/local/apache2/conf/server.key
COPY server.crt       /usr/local/apache2/conf/server.crt
COPY lms-mapping.py   /usr/local/apache2/conf/lms-mapping.py
COPY lms-mapping.json /usr/local/apache2/conf/lms-mapping.json

RUN echo "alias logs=\"tail -f /usr/local/apache2/logs/techolaf-access.log\"" >> /root/.bashrc
RUN echo "alias error-logs=\"tail -f /usr/local/apache2/logs/techolaf-error.log\"" >> /root/.bashrc
RUN echo "alias lms-mapping=\"/usr/local/apache2/conf/lms-mapping.py\"" >> /root/.bashrc

EXPOSE 80
EXPOSE 443
#CMD ["/bin/sleep", "10m"]
CMD ["httpd", "-D", "FOREGROUND"]
