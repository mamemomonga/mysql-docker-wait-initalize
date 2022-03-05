FROM golang:alpine

RUN set -xe && \
	apk add git make

ENV GOPATH=/go
ENV GOBIN=/go/bin
ENV GO111MODULE=on

ADD . /g/
WORKDIR /g
RUN set -xe && \
	go mod vendor && \
	GOOS=darwin  GOARCH=amd64 go build -o dist/mysql-up-wait-darwin-amd64 . && \
	GOOS=linux   GOARCH=amd64 go build -o dist/mysql-up-wait-linux-amd64 . && \
	GOOS=linux   GOARCH=arm64 go build -o dist/mysql-up-wait-linux-arm64 . && \
	GOOS=windows GOARCH=amd64 go build -o dist/mysql-up-wait-windows-amd64.exe .