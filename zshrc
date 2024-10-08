unset GREP_OPTIONS

export ZSH_THEME='bira'

source "${HOME}/.zgen/zgen.zsh"
# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/asdf
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/brew-cask
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/coffee
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/virtualenv
    zgen oh-my-zsh themes/bira
    zgen oh-my-zsh plugins/z

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-completions src
        zsh-users/zsh-syntax-highlighting
        felixr/docker-zsh-completion
EOPLUGINS

    # save all to init script
    zgen save
fi

#autocomplete
autoload -U compinit && compinit
zmodload -i zsh/complist

export DISABLE_UPDATE_PROMPT=true

# Customize to your needs...
export PATH=$HOME/bin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:./bin:$PATH
export TEMP=~/temp

# z stuff
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

alias l='ls -l'
alias ll='ls -lah'
alias ber='bundle exec rake'
alias bec='bundle exec cucumber'
alias sync_dotfiles='RCRC=rcrc rcup -v'

# fixing auto correct
alias git='nocorrect git'
alias bundle='nocorrect bundle'

# don't overwrite my Tmux names
DISABLE_AUTO_TITLE=true

# trying to get history search
autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end

export NODE_PATH=/usr/local/lib/node_modules:./node_modules:$NODE_PATH

#remove rake tab completion
compdef -d rake

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

alias resu='sudo $(history | tail -n1 | cut -c 8-)'

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias ports="lsof -i -P | grep -i 'LISTEN'"

#supermove
autoload -U zmv
alias mmv='noglob zmv -W'

export LESS="R"
export PATH="./node_modules/.bin:$PATH"

#Swift Package Manager
export TOOLCHAINS=swift
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH

PATH="~/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="~/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="~/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"~/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=~/perl5"; export PERL_MM_OPT;
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
      [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
              eval "$("$BASE16_SHELL/profile_helper.sh")"

export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon ~/.gnupg/.gpg-agent-info)
fi

GPG_TTY=$(tty)
export GPG_TTY

alias ctags="`brew --prefix`/bin/ctags"

alias i="figlet -f poison i $@"

compctl -g '~/.teamocil/*(:t:r)' teamocil

export PATH="$(yarn global bin):$PATH"
export GOPATH=$HOME/go
export PATH="$GOPATH:$PATH:/usr/local/go/bin"

export GIT_DUET_CO_AUTHORED_BY=1

alias dcr="docker-compose run"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
export ASDF_NODEJS_LEGACY_FILE_DYNAMIC_STRATEGY=latest_installed

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^R' history-incremental-search-backward # override FZF Ctrl-R searching
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

GIT_INITIALS="$(git config duet.env.git-author-initials) $(git config duet.env.git-commiter-initials)"
export TERM=xterm-256color
alias ag="rg"

eval "$(direnv hook zsh)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

alias fix_cameras="sudo killall VDCAssistant"
export N_PREFIX=$HOME/local/n
export PATH=~/local/n/bin:$PATH
export TMPDIR=/Users/csvenningsen/tmp

bindkey -e
bindkey \^U backward-kill-line

source ~/.dotfiles/scripts/zsh-git.sh
. $HOME/.ghcup/env
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/sbin:$PATH"

# Use leading space to keep command out of history
setopt HIST_IGNORE_SPACE

alias whatsmyip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com | sed 's/^\"\(.*\)\"$/\1/' | sed 's/\n//'"
