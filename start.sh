#!/bin/sh
cd "$(dirname "$0")"

./manage.py compilemessages
rm -rf _static && ./manage.py collectstatic

exec su daemon -c "./manage.py runserver --host=0.0.0.0 --port=8888"
