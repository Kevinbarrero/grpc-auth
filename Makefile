protogen:
	protoc -I proto proto/sso/sso.proto --go_out=./gen/go --go_opt=paths=source_relative --go-grpc_out=./gen/go/ --go-grpc_opt=paths=source_relative
rungrpc:
	go run cmd/sso/main.go --config=./config/local.yaml
migrate:
	go run ./cmd/migrator --storage-path=./storage/sso.db --migrations-path=./migrations
migrateTest:
	go run ./cmd/migrator/main.go --storage-path=./storage/sso.db --migrations-path=./tests/migrations --migrations-table=migrations_tests
.PHONY: protogen rungrpc migrate migrateTest
