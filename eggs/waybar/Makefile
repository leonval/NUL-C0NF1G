.PHONY: help


help: ## Print help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

build: ## Build style.css file from style.scss
	@sass style.scss style.css || { printf "\033[31m✘ Failed to build style.css\033[0m\n"; exit 1; }
	@printf "\033[32m✔ Successfully built style.css\033[0m\n"

reload: ## Reload waybar service
	@systemctl --user reload waybar.service || { printf "\033[31m✘ Failed to reload Waybar"; exit 1; }
	@printf "\033[32m✔ Waybar reloaded\033[0m\n"
