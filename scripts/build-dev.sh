# Make sure errors propagate throughout the script
set -e

docker build -f="Dockerfile-jekyll" -t docker-dcycleu-dev-jekyll .
docker run -d -v $(pwd):/srv/jekyll/ docker-dcycleu-dev-jekyll /bin/bash -c 'jekyll build --watch --force_polling'

docker build -f="Dockerfile-nginx" -t docker-dcycleu-dev-nginx .
docker run -d -p 80:80 -v $(pwd)/_site:/usr/share/nginx/html/ docker-dcycleu-dev-nginx
