#!/bin/bash
#docker stack deploy movieplex -c docker-compose.yml
docker service update --image 52.232.26.254/dev/movieplex7-client:latest $1