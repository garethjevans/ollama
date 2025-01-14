#!/usr/bin/env bash

set -euo pipefail

LOCATION=garethjevans/ollama

docker rm --force ollama || true
docker rmi --force ollama/ollama

docker pull ollama/ollama

docker run -d --platform linux/amd64 -p 11434:11434 --name ollama ollama/ollama
sleep 2

docker exec ollama ollama run llama3.2:1b
docker exec ollama ollama run all-minilm || true

docker exec ollama ollama ps

docker commit ollama $LOCATION

docker push --platform linux/amd64 $LOCATION
