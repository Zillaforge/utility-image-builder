FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN apt-get install -y wget make git ruby ruby-dev rubygems build-essential mysql-client curl jq duc


ARG PYTHON_MAJOR_VER
ENV MATPLOTLIB_PATH=/usr/local/lib/python${PYTHON_MAJOR_VER}/site-packages/matplotlib

ARG BUILDPLATFORM
RUN if [ "$BUILDPLATFORM" = "linux/arm64" ]; then \
		GOLANG_PACKAGE="go1.22.4.linux-arm64.tar.gz";  \
	else \         
		GOLANG_PACKAGE="go1.22.4.linux-amd64.tar.gz"; \    
    fi 											&& \
	wget https://go.dev/dl/$GOLANG_PACKAGE   	&& \
	tar -C /usr/local -xzf $GOLANG_PACKAGE 		&& \
    rm $GOLANG_PACKAGE

RUN gem install --no-document fpm

ENV PATH=$PATH:/usr/local/go/bin

RUN go env -w GOFLAGS=-buildvcs=false

WORKDIR /home
