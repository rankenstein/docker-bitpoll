#!/bin/sh
cd /bitpoll

./manage.py compilemessages
rm -rf _static && ./manage.py collectstatic
chmod a+w _static/scss/*.css

exec su daemon -s/bin/sh -c "./manage.py runserver 0.0.0.0:8888"
