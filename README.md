# Prototype Component Repo

This repo is a prototype for what a Deis component's Git repository
should look like.

A Deis component is...

- An isolated piece of functionality (e.g. a microservice)
- That can be packaged into a container (via `docker build`)

Typically, Deis components are written in Go.

## Practical Usage

If you want to experiment with creating a new repo using this framework,
try something like this:

```
$ mkdir my_project
$ cd my_project
$ curl -fsSL https://github.com/deis/prototype-repo/archive/master.tar.gz | tar -zxv --strip-components 1
```

## Common Conventions

Source code should be built either outside of Docker or in a special
Docker build phase.

A separate Dockerfile should be used for building the image. That
Dockerfile should always be placed inside of the `rootfs` directory, and
should manage the final image size appropriately.

(See the Makefile for one possible way of doing a Docker build phase)

## RootFS

All files that are to be packaged into the container should be written
to the `rootfs/` folder.

## Extended Testing

Along with unit tests, Deis values functional and integration testing.
These tests should go in the `_tests` folder.
