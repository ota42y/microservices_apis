package main

import (
	"context"
	"fmt"

	empty "github.com/golang/protobuf/ptypes/empty"
	"google.golang.org/grpc"

	app "github/ota42y/microservices_apis/grpc/pb/app"
)

func main() {
	conn, _ := grpc.Dial("server_host:80", grpc.WithInsecure())
	defer conn.Close()

	client := app.NewApplicationClient(conn)
	res, _ := client.GetApps(context.TODO(), &empty.Empty{})

	for _, item := range res.Items {
		fmt.Printf("result: id = %v, description=%s \n", item.Id, item.Description)
	}
}
