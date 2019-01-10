
GOCMD=go
DEPCMD=dep
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
BINARY_NAME=aws_test
BINARY_UNIX=$(BINARY_NAME)_unix
DEPINIT=$(DEPCMD) init
DEPENSURE=$(DEPCMD) ensure

all: test build
build:
	$(GOBUILD) -o $(BINARY_NAME) -v hello.go
test:
	$(GOTEST) -v ./...
clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
	rm -f $(BINARY_UNIX)
cleanall:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)
	rm -f $(BINARY_UNIX)
	rm -f $(BINARY_NAME).log
run:p
	$(GOBUILD) -o $(BINARY_NAME) -v hello.go
	./$(BINARY_NAME)
deps:
	test -f Gopkg.toml || $(DEPINIT) -v
	$(DEPENSURE) -v

# Cross compilation
build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_UNIX) -v hello.go

docker-build:
	docker run --rm -it -v $(GOPATH):/go -w /go/src/aws_test golang:1.11-alpine go build -o $(BINARY_UNIX) -v src/main.go
