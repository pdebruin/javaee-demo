#!/bin/bash

eval "$(<env.sh)"
docker version
docker info
docker service update --image 52.232.26.254/dev/movieplex7-client:latest $1