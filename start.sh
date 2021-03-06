#!/bin/bash

docker stop apacheserver || true
docker rm apacheserver || true

echo "starting reverse proxy [TCP/90] in the background ..."
docker run -d --rm \
       --name apacheserver \
       -p 90:80 \
       -p 993:443 \
       -v $(readlink -f apacheconf/sites):/usr/local/apache2/conf/sites \
       -v $(readlink -f apacheconf/htmlfiles):/usr/local/apache2/techolaf \
       httpd-proxyenabled


#docker run -d --name apacheserver -p 90:80 -v $(readlink -f apacheconf/sites):/usr/local/apache2/conf/sites -v $(readlink -f apacheconf/htmlfiles):/usr/local/apache2/techolaf httpd-proxyenabled
