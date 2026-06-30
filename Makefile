ECHO_PREFIX = [make]

.PHONY: run
run:
	@go run ./cmd/foxthought

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

OUTPUT_NAME=./bin/foxthought-$(GOOS)-$(GOARCH)$(if $(filter windows,$(GOOS)),.exe,)

.PHONY: build-arch
build-arch:
	@echo '${ECHO_PREFIX} Building $(GOOS)/$(GOARCH)...'
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o=$(OUTPUT_NAME) ./cmd/foxthought

.PHONY: build
build:
	@$(MAKE) --no-print-directory build-arch GOOS=linux GOARCH=amd64
	@$(MAKE) --no-print-directory build-arch GOOS=linux GOARCH=arm64
	@$(MAKE) --no-print-directory build-arch GOOS=darwin GOARCH=amd64
	@$(MAKE) --no-print-directory build-arch GOOS=darwin GOARCH=arm64
	@$(MAKE) --no-print-directory build-arch GOOS=windows GOARCH=amd64
