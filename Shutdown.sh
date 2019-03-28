#!/bin/bash

docker stack rm db
docker stack rm prod
docker network rm swarmnet
