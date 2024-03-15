# zsh settings

## default prompt initialization
# autoload -Uz promptinit
# promptinit
# prompt adam1

## History
### Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt histignorealldups sharehistory

## Key bindings
### Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

### Ctrl bindings
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-delete-word


# Colors
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# ZSH plugins
## zsh-autosuggestions
source ~/.zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## zsh-completions
fpath=($HOME/.zsh_plugins/zsh-completions/src $fpath)

## zsh-syntax-highlighting
source ~/.zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Repo
## brew
if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# Starship
if type starship &>/dev/null; then
    eval "$(starship init zsh)"
fi


# Tools
## eza
if type eza &>/dev/null; then
    alias ls="eza"
    alias ll="eza -l"
    alias la="eza -la"
    alias lt="eza -T -L 3"
    alias tree="eza -T"
fi

## direnv
eval "$(direnv hook zsh)"

## Go
export PATH=/home/oys/go/bin:$PATH
export GOROOT_LATEST=/usr/local/go
export GOROOT_1_19_13=/home/oys/sdk/go1.19.13

## NodeJS
### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Completions
## brew
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

## starship
if type starship &>/dev/null; then
    source <(starship completions zsh)
fi

## velero
if type velero &>/dev/null; then
    velero completion zsh >"${fpath[1]}/_velero"
fi

## kind
if type kind &>/dev/null; then
    kind completion zsh >"${fpath[1]}/_kind"
fi

## helm
if type helm &>/dev/null; then
    helm completion zsh > "${fpath[1]}/_helm"
fi


# Use modern completion system
autoload -Uz compinit
compinit
