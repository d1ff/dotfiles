export TERM=screen-256color
[[ -f "~/.$TERM.ti" ]] && tic ~/.$TERM.ti
export CLICOLOR=1
export FZF_DEFAULT_COMMAND='pt -g ""'
alias vim="nvim"
alias vimdiff="nvim -d"

setopt autocd
autoload -U is-at-least zmv

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

export PATH="$HOME/.brew/bin:$PATH"
export RUST_SRC_PATH="$HOME/Programming/rustc-1.7.0/src"
export PATH="/usr/local/texlive/2015/bin/x86_64-darwin:$HOME/.brew/sbin:$HOME/.cargo/bin:$HOME/.cabal/bin:$HOME/bin/:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=nvim


# You may need to manually set your language environment
export LANG=en_US.UTF-8

export ZPLUG_HOME=$HOME/.brew/opt/zplug
source $ZPLUG_HOME/init.zsh

#zplug "tevren/gitfast-zsh-plugin"
zplug "chrissicool/zsh-256color"
zplug "peterhurford/git-it-on.zsh"
zplug "sharat87/zsh-vim-mode"
zplug "jreese/zsh-titles"
zplug "plugins/brew", from:oh-my-zsh, nice:10, lazy:true
zplug "plugins/brew-cask", from:oh-my-zsh, nice:10, lazy:true
zplug "plugins/gitfast", from:oh-my-zsh, nice:10, lazy:true
zplug "plugins/pip", from:oh-my-zsh, lazy:true
zplug "plugins/python", from:oh-my-zsh, lazy:true
zplug "plugins/rsync", from:oh-my-zsh, lazy:true
zplug "plugins/common-aliases", from:oh-my-zsh, nice:11
zplug "plugins/tmux", from:oh-my-zsh, nice:10
zplug "zsh-users/zsh-syntax-highlighting", nice:19
zplug "zsh-users/zsh-completions", use:"src"
zplug "zsh-users/zsh-history-substring-search", nice:12
zplug "zsh-users/zsh-autosuggestions", nice:12
zplug "aperezdc/virtualz", lazy:true
zplug "supercrabtree/k", lazy:true
zplug "d1ff/ca16a0e2ac25738a2063c846e62dc882", from:gist
zplug "~/.brew/share/zsh/site-functions", from:local
zplug "b4b4r07/enhancd", use:init.sh

zplug load #2> /dev/null

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

export GPG_TTY=$(tty)
if [ -f "${HOME}/.gpg-agent-info" ]; then
  . "${HOME}/.gpg-agent-info"
  export GPG_AGENT_INFO
fi

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    /usr/bin/ssh-add -l > /dev/null;
}

# Source SSH settings, if applicable
start_agent
