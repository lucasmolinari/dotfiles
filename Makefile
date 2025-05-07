# Detect /etc/...
ETC_PKGS := $(shell find . -maxdepth 1 -type d -exec test -d {}/etc \; -exec basename {} \;)

# Detect user packages (exclude system packages and dotdirs like .git)
COMMON_PKGS := $(shell comm -23 <(ls -d */ | sed '/^\./d' | tr -d '/') <(echo "$(ETC_PKGS)"))

stow-all: stow-packages

stow:
	@stow --verbose --target=$$HOME $(COMMON_PKGS)
	
	@for pkg in $(ETC_PKGS); do \
		sudo stow --verbose --target=/ $$pkg; \
	done

unstow:
	@stow --delete --target=$$HOME $(COMMON_PKGS)
	
	@for pkg in $(ETC_PKGS); do \
		sudo stow --delete --target=/ $$pkg; \
	done
