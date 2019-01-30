#!/bin/bash
#docker stack deploy movieplex -c docker-compose.yml
docker service update --image dtr.dckr.it/dev/movieplex7-client:latest $1