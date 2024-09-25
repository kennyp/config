# Make sure deps are installed
DEPS = stow op
DEPS_OUT := $(foreach dep,$(DEPS),$(if $(shell which $(dep)),$(dep),$(error "No $(dep) in PATH!")))

PACKAGES ?= $(patsubst %/,%,$(sort $(dir $(wildcard */)))) ## Packages to adopt (defaults to all)
TEMPLATES := $(patsubst %.tmpl,%,$(shell find $(foreach p,$(PACKAGES),./$(p) ) -type f -name '*.tmpl'))

# Define the ADOPT command
ADOPT := stow --ignore="\.tmpl" --dotfiles -t "$(HOME)" --adopt

# Formatting/Display
VERBOSE ?= 0 ## Should commands be printed (0 or 1, default: 0)
Q := $(if $(filter 1,$(VERBOSE)),,@)
M = $(shell printf "\033[34;1m▶\033[0m")
T = $(shell printf " ")

.PHONY: help
help: ## Show this help text
	@printf "\033[34m%s\033[0m\n" "Targets"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[33m%-30s\033[0m %s\n", $$1, $$2}'
	@printf "\n\033[34m%s\033[0m\n" "Variables"
	@grep -E '^[A-Z_-]+ .?= .*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = " .?= .*?## "}; {printf "\033[33m%-30s\033[0m %s\n", $$1, $$2}'
	@printf "\n\033[34m%-30s %s\033[0m\n" "Utility" "Path"
	@$(foreach dep,$(DEPS),printf "\033[33m%-30s\033[0m %s\n" $(dep) $(shell which $(dep)); )
	@printf "\n\033[34m%-40s %s\033[0m\n" "Template" "Target"
	@$(foreach f,$(TEMPLATES),printf "\033[33m%-40s\033[0m %s\n" "$(f).tmpl" $(f); )

.PHONY: adopt
adopt: $(TEMPLATES) ## Generate from templates and adopt PACKAGES
	$(Q) $(foreach pkg,$(PACKAGES),$(call log,"adopting\ $(pkg)") && $(ADOPT) $(pkg); )

%: %.tmpl
	$(Q) op inject -f -i $< -o $@

log = printf "\033[34;1m▶\033[0m %s…\n" "$(1)"
