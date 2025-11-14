# Dotfiles

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).
Stow creates *symbolic links* in the home directory based on the directory structure inside each package.

Example:
```
stow .config/nvim
```
This creates `~/.config/nvim` → `dotfiles/.config/nvim`

Paths can be added to `.stow-local-ignore` to be ignored.
