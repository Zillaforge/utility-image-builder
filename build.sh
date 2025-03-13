#!/bin/bash

docker build -t ociscloud/protobuf:5.27.2- -f Dockerfile-5.27 .
docker build -t ociscloud/protobuf:5.28.0- -f Dockerfile-5.28 .
docker build -t ociscloud/protobuf:4.22.0- -f Dockerfile-4.22 .
