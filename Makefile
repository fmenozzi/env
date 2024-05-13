# TODO: Somehow detect platform (e.g. arch vs debian vs raspbian) and adjust
#       relevant targets accordingly (conditional rule based on "which pacman",
#		"which apt", etc?)

all: desktop

bash:
	@echo "bash"

bash-lite:
	@echo "bash lite"

vim:
	@echo "vim"

vim-lite:
	@echo "vim-lite"

gnome: bash vim
	@echo "gnome"

lite: bash-lite vim-lite
	@echo "lite"

desktop: gnome
	@echo "desktop"

raspi: lite
	@echo "raspi"

# TODO: Do we need to run "symlinker clean <config>" for all possible configs
#       in order to ensure that all symlinks that we've ever made are removed?
clean:
	@echo "clean"
