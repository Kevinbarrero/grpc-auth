protogen:
	protoc -I proto proto/sso/sso.proto --go_out=./gen/go --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
rungrpc:
	go run cmd/sso/main.go --config=./config/local.yaml
migrate:
	go run ./cmd/migrator --storage-path=./storage/sso.db --migrations-path=./migrations
.PHONY: protogen rungrpc migrate
