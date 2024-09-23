# Make sure deps are installed
DEPS = stow keybase
DEPS_OUT := $(foreach dep,$(DEPS),$(if $(shell which $(dep)),$(dep),$(error "No $(dep) in PATH!")))

CRYPTED := $(shell find . -name '*.gpg')
PLAIN := $(foreach c,$(CRYPTED), $(basename $(c)))

# Formatting/Display
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

.PHONY: load
load: $(PLAIN) ## Decrypt and adopt all packages
	$(call start,adopting)
	$(Q) stow -t "$(HOME)" --adopt fish
	$(Q) stow -t "$(HOME)" --adopt alacritty
	$(Q) stow -t "$(HOME)" --adopt git
	$(Q) stow -t "$(HOME)" --adopt nvim
	$(Q) stow -t "$(HOME)" --adopt zellij

.PHONY: decrypt
decrypt: $(PLAIN) ## Decrypt all of the .gpg files.
	$(call success,done)

.PHONY: encrypt
encrypt: $(PLAIN) ## Encrypt all of the plain text versions of .gpg files.
	$(call start,encrypting)
	$(Q) $(foreach p,$(PLAIN),keybase encrypt -i $(p) -o $(p).gpg kennyp; )
	$(call success,done)

$(PLAIN): $(CRYPTED)
	$(call start,decrypting $@.gpg)
	$(Q) keybase decrypt -i $@.gpg -o $@
	$(call success,done)

start = $(Q) printf "\033[34;1m▶\033[0m %s…\n" "$(1)"

success = $(Q) printf "\033[32;1m✔️\033[0m %s\n" "$(1)"

failure = $(Q) printf "\033[31;1m✗\033[0m %s\n" "$(1)"
