#!/bin/sh
sudo usermod -aG docker $USER
docker-compose down
docker container rm $(docker container ls -aq)
docker image rm $(docker image ls -aq)
docker volume rm $(docker volume ls -q)
sudo rm -rf postgres
sudo rm -rf node_modules
