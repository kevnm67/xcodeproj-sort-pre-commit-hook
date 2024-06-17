help: ## Display this help
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-27s\033[0m %s\n", $$1, $$2}'

default: build install ## Build and install the gem

build: ## [CI] Build the gem from the gemspec
	gem build xcodeproj-sort.gemspec
	
install: ## [CI] Install the xcodeproj-sort.gem
	gem build xcodeproj-sort.gemspec
	gem install xcodeproj-sort-1.1.5.gem

.PHONY: \
	build \
	install \
	default
