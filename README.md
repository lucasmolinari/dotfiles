# Dotfiles

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).
Stow creates *symbolic links* in the home directory based on the directory structure inside each package.

Each top-level directory in the repository is treated as a package. Its internal structure should match the target location in $HOME.

From the repository root, run:
```
stow .config/nvim
```
This creates the *symlink* `~/.config/nvim` → `~/dotfiles/.config/nvim`

#### Notes 
- `stow .` can be used in the repository root to create *symlinks* of all packages.
- Paths can be added to `.stow-local-ignore` to be ignored.
