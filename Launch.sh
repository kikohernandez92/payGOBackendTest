#!/bin/bash

docker network create --driver=overlay --attachable swarmnet
docker stack deploy -c db.yml db
#docker build -t kikohernandez92/laravel .
#docker push kikohernandez92/laravel
docker stack deploy -c stack.yml prod
