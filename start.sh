docker run -d --name apacheserver -p 90:80 -v $(readlink -f apacheconf/sites):/usr/local/apache2/conf/sites -v $(readlink -f apacheconf/htmlfiles):/usr/local/apache2/techolaf httpd-proxyenabled
