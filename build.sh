#!/bin/bash

docker build \
	--build-arg PROTOC_VER=27.2 \
	--build-arg PROTOC_GEN_GO_VER=1.34.2 \
	--build-arg PROTOC_GEN_GO_GRPC_VER=1.5.1 \
	--build-arg PROTOC_GO_INJECT_TAG_VER=1.4.0 \
	-t ociscloud/protobuf:5.27.2- .

docker build \
	--build-arg PROTOC_VER=28.0 \
	--build-arg PROTOC_GEN_GO_VER=1.34.2 \
	--build-arg PROTOC_GEN_GO_GRPC_VER=1.5.1 \
	--build-arg PROTOC_GO_INJECT_TAG_VER=1.4.0 \
	-t ociscloud/protobuf:5.28.0- .

docker build \
	--build-arg PROTOC_VER=22.0 \
	--build-arg PROTOC_GEN_GO_VER=1.28.1 \
	--build-arg PROTOC_GEN_GO_GRPC_VER=1.3.0 \
	--build-arg PROTOC_GO_INJECT_TAG_VER=1.4.0 \
	-t ociscloud/protobuf:4.22.0- .
