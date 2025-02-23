
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
asdf
colored-man-pages
colorize
virtualenv
vi-mode
vscode
web-search
zsh-syntax-highlighting
zsh-autosuggestions
history
history-substring-search
fzf
extract
git
tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# CUDA
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}

# Local bin
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:~/.local/bin"

# Aliases
alias restart_audio='pulseaudio -k && sudo alsa force-reload'

# Autosuggestions
bindkey '^ ' forward-word
# Enable autosuggestions automatically

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/.local/lib


# PYENV
export PYENV_ROOT="/data/.pyenv"
export PATH="/data/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


# NRP
#export HBP=$HOME/Documents/NRP
#export NRP_INSTALL_MODE=user

#export NVM_DIR="/home/schulze/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# VPN
alias svpn='sudo openvpn --config ~/VPN/client.ovpn'

# Umlaute
setxkbmap -option compose:ralt


# Wetter
alias wetter='curl wttr.in/karlsruhe'
#source /data/catkin_melodic_ws/devel/setup.zsh

alias iveco='xfreerdp /u:schulze /d:FZI /v:ids-iveco.fzi.de /microphone:sys:pulse /sound:sys:alsa,quality:high /w:1800 /h:1000 /drive:home,$HOME'

# robot_folders setup
source /data/robot_folders/robot_folders/bin/fzirob_source.sh

# colcon argcompletion
#source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh

# Nodejs
load_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# source /opt/ros/melodic/setup.zsh


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/data/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/data/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/data/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/data/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8



alias docker_container_rm='sudo docker rm -f $(docker ps -a -q)'
alias docker_images_rm='sudo  docker rmi $(sudo docker images --filter "dangling=true" -q --no-trunc)'


alias docker_ports='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}" -a'

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

docker-ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}
#source /opt/ros/melodic/setup.zsh
#export ROS_MASTER_URI=http://ids-ridgeback-1:11311
#export ROS_IP=192.168.0.5

# Default Editor
export EDITOR=vim
#export PAGER=more

# File Manager Settings
#export NNN_FALLBACK_OPENEDER=xdg-open
