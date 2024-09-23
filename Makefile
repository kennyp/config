# Make sure deps are installed
DEPS = stow keybase
DEPS_OUT := $(foreach dep,$(DEPS),$(if $(shell which $(dep)),$(dep),$(error "No $(dep) in PATH!")))

# Verbosity
VERBOSE ?= 0 ## Set verbosity level (default 0)
__verbosity_1_ = @
__verbosity_1_0 = @
__verbosity_2_ = @
__verbosity_2_0 = @
__verbosity_2_1 = @

Q1=$(__verbosity_1_$(VERBOSE))
Q2=$(__verbosity_2_$(VERBOSE))

.PHONY: help
help: ## Show this help text
	@printf "\033[34m%s\033[0m\n" "Targets"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[33m%-30s\033[0m %s\n", $$1, $$2}'
	@printf "\n\033[34m%s\033[0m\n" "Variables"
	@grep -E '^[A-Z_-]+ .?= .*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = " .?= .*?## "}; {printf "\033[33m%-30s\033[0m %s\n", $$1, $$2}'
	$(foreach dep,$(DEPS),$(shell printf "\033[33m%-30s\033[0m %s\n" $(dep) $(dep)))

.PHONY: load
load: ## Decrypt and adopt all packages
	$(info adopting...)
	$(Q1)stow -t "$(HOME)" --adopt fish
	$(Q1)stow -t "$(HOME)" --adopt alacritty
	$(Q1)keybase decrypt -i git/.config/git/personal.gpg -o git/.config/git/personal
	$(Q1)keybase decrypt -i git/.config/git/heroku.gpg -o git/.config/git/heroku
	$(Q1)keybase decrypt -i git/.config/git/salesforce.gpg -o git/.config/git/salesforce
	$(Q1)stow -t "$(HOME)" --adopt git
	$(Q1)stow -t "$(HOME)" --adopt nvim
	$(Q1)stow -t "$(HOME)" --adopt zellij
