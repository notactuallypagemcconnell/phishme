#!/usr/bin/make -f

NAME=notactuallypagemcconnell/onepg
SHELL=/usr/bin/env bash

phish:
	docker build --build-arg LANG="en_US.UTF-8" -t phishme:latest .


