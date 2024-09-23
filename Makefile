VERBOSE ?= 0
__verbosity_1_ = @
__verbosity_1_0 = @
__verbosity_2_ = @
__verbosity_2_0 = @
__verbosity_2_1 = @

Q1=$(__verbosity_1_$(VERBOSE))
Q2=$(__verbosity_2_$(VERBOSE))

.PHONY: load
load:
	$(info adopting...)
	$(Q1)stow -t "$(HOME)" --adopt fish
	$(Q1)stow -t "$(HOME)" --adopt alacritty
	$(Q1)keybase decrypt -i git/.config/git/personal.gpg -o git/.config/git/personal
	$(Q1)keybase decrypt -i git/.config/git/heroku.gpg -o git/.config/git/heroku
	$(Q1)keybase decrypt -i git/.config/git/salesforce.gpg -o git/.config/git/salesforce
	$(Q1)stow -t "$(HOME)" --adopt git
	$(Q1)stow -t "$(HOME)" --adopt nvim
	$(Q1)stow -t "$(HOME)" --adopt zellij
