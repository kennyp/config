# Make sure deps are installed
DEPS = stow keybase
DEPS_OUT := $(foreach dep,$(DEPS),$(if $(shell which $(dep)),$(dep),$(error "No $(dep) in PATH!")))

CRYPTED := $(shell find . -name '*.gpg')
PLAIN := $(foreach c,$(CRYPTED), $(basename $(c)))
ADOPT := stow --dotfiles -t "$(HOME)" --adopt
PACKAGES ?= fish alacritty git nvim zellij ## Packages to adopt (default: fish alacritty git nvim zellij)

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
	@printf "\n\033[34m%s\033[0m\n" "Dependancies"
	@$(foreach dep,$(DEPS),printf "\033[33m%-30s\033[0m %s\n" $(dep) $(shell which $(dep)); )
	@printf "\n\033[34m%s\033[0m\n" "Encrypted Files"
	@$(foreach f,$(PLAIN),printf "\033[33m%-40s\033[0m %s.gpg\n" $(f) $(f); )

.PHONY: adopt
adopt: $(PLAIN) ## Decrypt and adopt all packages
	$(Q) $(foreach pkg,$(PACKAGES),$(call start,"adopting $(pkg)") && $(ADOPT) $(pkg); )

.PHONY: decrypt
decrypt: $(PLAIN) ## Decrypt all of the .gpg files.
	$(Q) $(call success,done)

.PHONY: encrypt
encrypt: $(PLAIN) ## Encrypt all of the plain text versions of .gpg files.
	$(Q) $(call start,encrypting)
	$(Q) $(foreach p,$(PLAIN),keybase encrypt -i $(p) -o $(p).gpg kennyp; )
	$(Q) $(call success,done)

$(PLAIN): $(CRYPTED)
	$(Q) $(call start,decrypting $@.gpg)
	$(Q) keybase decrypt -i $@.gpg -o $@
	$(Q) $(call success,done)

start = printf "\033[34;1m▶\033[0m %s (%s)…\n" "$(1)"

success = printf "\033[32;1m✔️\033[0m %s\n" "$(1)"

failure = printf "\033[31;1m✗\033[0m %s\n" "$(1)"
