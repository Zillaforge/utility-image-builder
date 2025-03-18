OWNER ?= ociscloud
IMAGE_NAME ?= protobuf
OS ?= ubuntu


.PHONY: release-image-5.27
release-image-5.27:
	docker build \
	--build-arg PROTOC_VER=27.2 \
	--build-arg PROTOC_GEN_GO_VER=1.34.2 \
	--build-arg PROTOC_GEN_GO_GRPC_VER=1.5.1 \
	--build-arg PROTOC_GO_INJECT_TAG_VER=1.4.0 \
	-t $(OWNER)/$(IMAGE_NAME):5.27.2-$(OS) .

.PHONY: release-image-5.28
release-image-5.28:
	docker build \
	--build-arg PROTOC_VER=28.0 \
	--build-arg PROTOC_GEN_GO_VER=1.34.2 \
	--build-arg PROTOC_GEN_GO_GRPC_VER=1.5.1 \
	--build-arg PROTOC_GO_INJECT_TAG_VER=1.4.0 \
	-t $(OWNER)/$(IMAGE_NAME):5.28.0-$(OS) .

.PHONY: release-image-4.22
release-image-4.22:
	docker build \
	--build-arg PROTOC_VER=22.0 \
	--build-arg PROTOC_GEN_GO_VER=1.28.1 \
	--build-arg PROTOC_GEN_GO_GRPC_VER=1.3.0 \
	--build-arg PROTOC_GO_INJECT_TAG_VER=1.4.0 \
	-t $(OWNER)/$(IMAGE_NAME):4.22.0-$(OS) .

.PHONY: release-image
release-image: release-image-5.27 release-image-5.28 release-image-4.22
