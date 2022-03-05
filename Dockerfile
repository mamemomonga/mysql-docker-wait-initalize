FROM golang:alpine

RUN set -xe && \
	apk add git make

ENV GOPATH=/go
ENV GOBIN=/go/bin
ENV GO111MODULE=on
ENV APPNAME=mysql-docker-wait-initalize

ADD . /g/
WORKDIR /g
RUN set -xe && \
	go mod vendor && \
	GOOS=darwin  GOARCH=amd64 go build -o dist/$APPNAME-darwin-amd64      . && \
	GOOS=linux   GOARCH=amd64 go build -o dist/$APPNAME-linux-amd64       . && \
	GOOS=linux   GOARCH=arm64 go build -o dist/$APPNAME-linux-arm64       . && \
	GOOS=windows GOARCH=amd64 go build -o dist/$APPNAME-windows-amd64.exe .
