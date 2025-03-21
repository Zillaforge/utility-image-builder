ARG PROTOC_VER=27.2
ARG PROTOC_GEN_GO_VER=1.34.2
ARG PROTOC_GEN_GO_GRPC_VER=1.5.1
ARG PROTOC_GO_INJECT_TAG_VER=1.4.0

FROM ociscloud/golang:1.22.4-ubuntu-amd64


WORKDIR /app

ARG PROTOC_GEN_GO_VER
ARG PROTOC_GEN_GO_GRPC_VER
ARG PROTOC_GO_INJECT_TAG_VER
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v${PROTOC_GEN_GO_VER}	&& \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v${PROTOC_GEN_GO_GRPC_VER} && \
    go install github.com/favadi/protoc-go-inject-tag@v${PROTOC_GO_INJECT_TAG_VER}


ARG PROTOC_VER
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VER}/protoc-${PROTOC_VER}-linux-x86_64.zip && \
    unzip protoc-${PROTOC_VER}-linux-x86_64.zip


ENV PATH="/app/bin:${PATH}"


