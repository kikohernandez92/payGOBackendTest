#!/bin/bash

docker network create --driver=overlay --attachable swarmnet
docker stack deploy -c localstack.yml local
