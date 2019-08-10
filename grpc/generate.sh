#!/bin/sh

docker-compose run protoc sh -c "mkdir -p pb && protoc --proto_path=./proto app.proto --go_out=plugins=grpc:pb"
