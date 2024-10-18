#!/bin/bash

sleep 60

sudo apt-get update -y
sudo apt-get install -y docker.io

sudo systemctl start docker
sudo systemctl enable docker

sudo docker run -d -p 80:80 --name hello-world-nginx nginx

echo "<html><body><h1>Hello World</h1></body></html>" > /home/ubuntu/index.html
sudo docker cp /home/ubuntu/index.html hello-world-nginx:/usr/share/nginx/html/index.html
