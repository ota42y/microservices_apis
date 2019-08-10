# Microservices API sample repository

## gRPC usage

```bash
cd grpc
docker-compose build
./generate.sh

docker-compose up -d
docker-compose run client
# result: id = 1, description=description
# result: id = 2, description=
```

## GraphQL usage

```bash
cd graphql
docker-compose build
docker-compose up -d

curl -X POST -d '{"query": "{  applications { id  description } player(id: 1) { name } }"}' -H "Content-Type: application/json" localhost:14567/graphql
# {"data":{"applications":[{"id":1,"description":null},{"id":2,"description":"id=2 application"}],"player":{"name":"Honoka"}}}
curl -X POST -d '{"query": "{  player(id: 2) { id name } }"}' -H "Content-Type: application/json" localhost:14567/graphql
{"data":{"player":{"id":2,"name":"Mari"}}}⏎
```
