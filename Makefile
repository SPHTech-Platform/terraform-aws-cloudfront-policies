.PHONY: help test

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

init: ## Run init for all submodules
	@set -euo pipefail; \
	for dir in ./modules/*; do \
		if [ -d "$$dir" ]; then \
			echo $$dir; \
			(cd $$dir && terraform init); \
		fi \
	done

test: ## Run tests for all submodules
	@set -euo pipefail; \
	for dir in ./modules/*; do \
    	if [ -d "$$dir" ]; then \
			echo $$dir; \
        	(cd $$dir && terraform test); \
        fi \
    done
