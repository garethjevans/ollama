#!/usr/bin/env bash

set -euo pipefail

LOCATION=garethjevans/ollama

docker build -t $LOCATION .

docker push $LOCATION
