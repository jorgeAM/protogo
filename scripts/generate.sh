#!/bin/bash

if ! command go version >/dev/null 2>&1; then
    echo "go is not installed"
    # code 127 is when a command is not found
    exit 127
fi

if ! command protoc --version >/dev/null 2>&1; then
    echo "protoc not found ... please install protobuf compiler in yout machine"
    # code 127 is when a command is not found
    exit 127
fi

export GO111MODULE=on # Enable module mode

PATH="$PATH:$(go env GOPATH)/bin"
export PATH

protoc --go_out=contactspb --go_opt=paths=source_relative \
    --go-grpc_out=contactspb --go-grpc_opt=paths=source_relative \
    addressbook.proto
