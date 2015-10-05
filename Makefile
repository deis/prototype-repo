export GO15VENDOREXPERIMENT=1
# VERSION := $(shell git describe --tags)
VERSION := 0.0.1
LDFLAGS := "-s -X main.version=${VERSION}"
BINDIR := ./rootfs

all:
	@echo "Use a Makefile to control top-level building of the project."

build:
	mkdir -p ${BINDIR}/bin
	docker run --rm -v ${PWD}:/app -w /app golang:1.5.1 make docker-compile

docker-compile:
	go build -o ${BINDIR}/bin/boot -a -installsuffix cgo -ldflags ${LDFLAGS} boot.go

deploy: kube-service kube-rc

kube-service:
	kubectl create -f def/foo-service.json

kube-rc:
	kubectl create -f def/foo-rc.json

kube-clean:
	kubectl delete rc foo

.PHONY: all build docker-compile kube-up kube-down deploy
