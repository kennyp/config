.PHONY: load
load:
	$(info adopting...)
	@ stow -t "$HOME" --adopt fish
	@ stow -t "$HOME" --adopt nvim
