ECHO_PREFIX = [make]

.PHONY: run
run:
	@go run ./cmd/foxthought

.PHONY: build
build:
	@echo '${ECHO_PREFIX} Building...'
	go build -o=./bin/foxthought ./cmd/foxthought

.PHONY: tidy
tidy:
	@echo '${ECHO_PREFIX} Tidying...'
	go mod tidy
	go mod verify
	go fmt ./...

.PHONY: audit
audit:
	@echo '${ECHO_PREFIX} Auditing...'
	go mod tidy -diff
	go mod verify
	go vet ./...
	go test -race -vet=off ./...
