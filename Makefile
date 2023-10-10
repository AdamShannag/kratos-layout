.PHONY: api
# generate api
api:
	find app -maxdepth 2 -type d -exec $(MAKE) -C {} api \;

.PHONY: wire
# generate wire
wire:
	find app -maxdepth 2 -type d -exec $(MAKE) -C {} wire \;

.PHONY: proto
# generate proto
proto:
	kratos proto client  api/
	find app -maxdepth 2 -type d -exec $(MAKE) -C {} proto \;

.PHONY: install
# install go modules
install:
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
	go install github.com/go-kratos/kratos/cmd/kratos/v2@latest
	go install github.com/go-kratos/kratos/cmd/protoc-gen-go-http/v2@latest
	go install github.com/google/gnostic/cmd/protoc-gen-openapi@latest
	go install github.com/google/wire/cmd/wire@latest
	go install entgo.io/ent/cmd/ent