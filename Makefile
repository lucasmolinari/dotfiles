# Detect /etc/...
ETC_PKGS := $(shell find . -maxdepth 1 -type d -exec test -d {}/etc \; -exec basename {} \;)

COMMON_PKGS := $(shell comm -23 <(ls -d */ | sed '/^\./d' | tr -d '/') <(echo "$(ETC_PKGS)"))

stow:
	@stow --verbose $(STOW_ARGS) --target=$$HOME $(COMMON_PKGS)

	@for pkg in $(ETC_PKGS); do \
		sudo stow --verbose $(STOW_ARGS) --target=/ $$pkg; \
	done

unstow:
	@stow --delete $(STOW_ARGS) --target=$$HOME $(COMMON_PKGS)

	@for pkg in $(ETC_PKGS); do \
		sudo stow --delete $(STOW_ARGS) --target=/ $$pkg; \
	done
