ARG GOLANG_VERSION=1.22.4
FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tzdata wget make git ruby ruby-dev rubygems build-essential mysql-client curl jq duc unzip && \
    rm -rf /var/lib/apt/lists/*


ARG GOLANG_VERSION
ENV GO_V=${GOLANG_VERSION}

ARG BUILDPLATFORM
RUN if [ "$BUILDPLATFORM" = "linux/arm64" ]; then 		\
		GOLANG_PACKAGE=go${GO_V}.linux-arm64.tar.gz;  	\
	else \         
		GOLANG_PACKAGE=go${GO_V}.linux-amd64.tar.gz; 	\
    fi 											&& \
	wget https://go.dev/dl/$GOLANG_PACKAGE   	&& \
	tar -C /usr/local -xzf $GOLANG_PACKAGE 		&& \
    rm $GOLANG_PACKAGE

RUN gem install --no-document fpm

ENV PATH=$PATH:/usr/local/go/bin

RUN go env -w GOFLAGS=-buildvcs=false

WORKDIR /home
