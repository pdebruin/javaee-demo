#!/bin/bash

eval "$(<env.sh)"
docker version
docker info