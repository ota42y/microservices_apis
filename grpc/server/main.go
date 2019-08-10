package main

import (
	"context"
	"fmt"
	"net"

	empty "github.com/golang/protobuf/ptypes/empty"
	"google.golang.org/grpc"

	app "github/ota42y/microservices_apis/grpc/pb/app"
)

type server struct{}

func (s *server) GetApps(ctx context.Context, in *empty.Empty) (*app.Apps, error) {
	ret := &app.Apps{
		Items: []*app.App{
			&app.App{
				Id:          1,
				Description: "description",
			},
			&app.App{
				Id: 2,
			},
		},
	}
	return ret, nil
}

func main() {
	fmt.Println("start")

	lis, _ := net.Listen("tcp", "0.0.0.0:80")

	s := grpc.NewServer()
	app.RegisterApplicationServer(s, &server{})

	if err := s.Serve(lis); err != nil {
		fmt.Println("faild server %v", err)
	}
}
