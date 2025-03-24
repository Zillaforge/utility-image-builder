ARG PROTOC_VER=27.2
ARG PROTOC_GEN_GO_VER=1.34.2
ARG PROTOC_GEN_GO_GRPC_VER=1.5.1
ARG PROTOC_GO_INJECT_TAG_VER=1.4.0
ARG OWNER=ociscloud 
ARG GOLANG_VERSION=1.22.4
ARG CPU_ARCH=amd64

FROM ${OWNER}/golang:${GOLANG_VERSION}-ubuntu-${CPU_ARCH}


WORKDIR /app

ARG PROTOC_GEN_GO_VER
ARG PROTOC_GEN_GO_GRPC_VER
ARG PROTOC_GO_INJECT_TAG_VER
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v${PROTOC_GEN_GO_VER}	&& \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v${PROTOC_GEN_GO_GRPC_VER} && \
    go install github.com/favadi/protoc-go-inject-tag@v${PROTOC_GO_INJECT_TAG_VER}	&& \
    go clean -cache ; go clean -modcache 



ARG PROTOC_VER
ENV PROTOC_V=${PROTOC_VER}

ARG BUILDPLATFORM
RUN if [ "$BUILDPLATFORM" = "linux/arm64" ]; then 		\
	PROTOC_PACKAGE=protoc-${PROTOC_V}-linux-aarch_64.zip ;\
    else \         
	PROTOC_PACKAGE=protoc-${PROTOC_V}-linux-x86_64.zip ;\
    fi 								&& \
    wget  https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VER}/${PROTOC_PACKAGE} && \
    unzip ${PROTOC_PACKAGE} && \
    rm    ${PROTOC_PACKAGE}



ENV PATH="/app/bin:${PATH}"


