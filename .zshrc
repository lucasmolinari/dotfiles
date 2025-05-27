if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit
zinit cdreplay -q

# Integrations
# xref: https://github.com/starship/starship/issues/3418#issuecomment-2477375663
if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi
eval "$(starship init zsh)"

eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"

# # # Cursor Change in VI mode
function zle-keymap-select {
  if [[ $KEYMAP == vicmd ]]; then
    echo -ne '\e[1 q'  # block cursor
  else
    echo -ne '\e[5 q'  # beam cursor
  fi
}
zle -N zle-keymap-select

function zle-line-init {
  echo -ne '\e[5 q'  # beam cursor
}
zle -N zle-line-init

function reset-cursor {
  echo -ne '\e[1 q'
}
trap reset-cursor EXIT

# # #

# Yazi
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^y' autosuggest-accept
bindkey '^ ' autosuggest-accept

# Ctrl-Z to run fg when in terminal
_zsh_cli_fg() { fg; }
zle -N _zsh_cli_fg
bindkey '^Z' _zsh_cli_fg

# Alias
alias ls='ls --color'
alias spectacle='spectacle -bcr'
alias lgit='lazygit'

alias kus='setxkbmap -layout us -variant intl'
alias kbr='setxkbmap -model abnt2 -layout br -variant abnt2'
alias kst='xmodmap -e "keycode 62 = dead_tilde"'
alias kss='xmodmap -e "keycode 62 = Shift_R"'

alias st='sudo systemctl start nginx && sudo systemctl start mysqld && sudo systemctl start php-fpm'

# Style
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=blue,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=blue

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

setopt NO_BEEP

export PATH="$HOME/code/z/dgen/zig-out/bin:$PATH"
export EDITOR="nvim"
