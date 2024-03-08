.PHONY: help test

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

test: ## Run tests for all submodules
	@for dir in ./modules/*; do \
    	if [ -d "$$dir" ]; then \
			echo $$dir; \
        	(cd $$dir && terraform init && terraform test); \
        fi \
    done
