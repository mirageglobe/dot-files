.DEFAULT_GOAL:=help
.PHONY: all clean test SHELL

SHELL:=/bin/bash

##@ Tools

.PHONY: build test deploy build-init test-init test-lint deploy-init run
# phony is used to make sure there is no similar file such as <target> that cause the make recipe not to work

# export $(cat .env | xargs) 				# loaded env files into current environment

# core commands

build: build-init											## build project
	@echo ":: build project - ok ::"

test: test-init test-lint 						## test project
	@echo ":: test project - ok ::"

deploy: deploy-init										## deploy files
	@echo ":: deploy project - ok ::"

# helper commands

build-init:
	@echo ":: checking build dependancies ::"
	@command -v semver
	@command -v node
	@command -v shellcheck
	@command -v bats
	@echo ":: checking environment variables ::"

test-init:
	@echo ":: testing project ::"
	bats -r test/*

test-lint:
	@echo ":: running lint ::"
	shellcheck src/fox.sh

deploy-init:
	@echo ":: deploy project ::"
	shellcheck src/fox.sh

# misc commands

run:																	## run project
	@echo ":: run project ::"

##@ Helpers

.PHONY: version vpatch vminor vmajor help

version: 									## show current version
	@git describe --tags --abbrev=0

vinit: 										## initialise first version
	@git tag 0.1.0

vpatch:											## show bumped version + patch (fix) - use : git tag $(make vpatch)
	@semver $$(git describe --tags --abbrev=0) -i patch

vminor:											## show bumped version + minor (non breaking) - use : git tag $(make vminor)
	@semver $$(git describe --tags --abbrev=0) -i minor

vmajor:											## show bumped version + major (breaking) - git tag $(make vmajor)
	@semver $$(git describe --tags --abbrev=0) -i major

help:  										## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
	@printf "\n"
