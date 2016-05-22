export TERM=xterm-256color
export CLICOLOR=1
export FZF_DEFAULT_COMMAND='pt -g ""'
alias vim="nvim"
alias vimdiff="nvim -d"

autoload -U is-at-least

# To have paths colored instead of underlined
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=yellow
ZSH_HIGHLIGHT_STYLES[alias]=fg=green
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green
ZSH_HIGHLIGHT_STYLES[builtin]=fg=green
ZSH_HIGHLIGHT_STYLES[function]=fg=green
ZSH_HIGHLIGHT_STYLES[command]=fg=green
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=green
ZSH_HIGHLIGHT_STYLES[path]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[path_prefix]=fg=cyan
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=cyan
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=none
ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

setopt HIST_IGNORE_ALL_DUPS
HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
HISTSIZE=1200                  # lines of history to maintain memory
SAVEHIST=1000                  # lines of history to maintain in history file.
setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information

HIST_STAMPS="dd.mm.yyyy"

ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true
#plugins=(vi-mode git-fast boot2docker brew brew-cask django docker docker-compose cp git-flow pip python rsync common-aliases zsh-syntax-highlighting tmux) #history-substring-search)

export RUST_SRC_PATH="$HOME/Programming/rustc-1.7.0/src"
export PATH="/usr/local/texlive/2015/bin/x86_64-darwin:/Users/d1ff/.brew/sbin:$HOME/.cargo/bin:/Users/d1ff/.cabal/bin:/Users/d1ff/.brew/bin:/Users/d1ff/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin"
# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=nvim


# You may need to manually set your language environment
export LANG=en_US.UTF-8

source ~/.zplug/init.zsh

#zplug "tevren/gitfast-zsh-plugin"
zplug "peterhurford/git-it-on.zsh"
zplug "zplug/zplug"
zplug "sharat87/zsh-vim-mode"
zplug "jreese/zsh-titles"
zplug "plugins/brew", from:oh-my-zsh, nice:10
zplug "plugins/brew-cask", from:oh-my-zsh, nice:10
zplug "plugins/gitfast", from:oh-my-zsh, nice:10
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/rsync", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh, nice:11
zplug "plugins/tmux", from:oh-my-zsh, nice:10
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "zsh-users/zsh-completions", use:"src"
zplug "zsh-users/zsh-history-substring-search", nice:11
zplug "zsh-users/zsh-autosuggestions", nice:12
zplug "aperezdc/virtualz"
zplug "d1ff/ca16a0e2ac25738a2063c846e62dc882", from:gist

zplug load


# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward

bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
_fzf_compgen_path() {
  pt -g "" "$1"
}
