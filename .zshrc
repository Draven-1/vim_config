# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
source /etc/profile
#export VIMRUNTIME=/root/.usr/vim/share/vim/vim82
# export LD_LIBRARY_PATH=$HOME/.usr/gcc/lib:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$HOME/.usr/gcc/lib64:$LD_LIBRARY_PATH
# export LD_LIBRARY_PATH=$HOME/.usr/gcc/libexec:$LD_LIBRARY_PATH

#vim                                                                                   
# alias vim=$HOME/.usr/vim/bin/vim                                                       
# alias vimdiff=$HOME/.usr/vim/bin/vimdiff                                               
# alias vimtutor=$HOME/.usr/vim/bin/vimtutor                                             
# alias ex=$HOME/.usr/vim/bin/ex                                                         
# alias rview=$HOME/.usr/vim/bin/rview
# alias view=$HOME/.usr/vim/bin/view
# alias xxd=$HOME/.usr/vim/bin/xxd
# alias rvim=$HOME/.usr/vim/bin/rvim
                                                                                       
#gcc                                                                                   
# alias c++=$HOME/.usr/gcc/bin/c++
# alias cpp=$HOME/.usr/gcc/bin/cpp
# alias g++=$HOME/.usr/gcc/bin/g++
# alias gcc=$HOME/.usr/gcc/bin/gcc
# alias gcc-ar=$HOME/.usr/gcc/bin/gcc-ar
# alias gccgo=$HOME/.usr/gcc/bin/gccgo
# alias gcc-nm=$HOME/.usr/gcc/bin/gcc-nm
# alias gcc-ranlib=$HOME/.usr/gcc/bin/gcc-ranlib
# alias gcov=$HOME/.usr/gcc/bin/gcov
# alias gcov-dump=$HOME/.usr/gcc/bin/gcov-dump
# alias gcov-tool=$HOME/.usr/gcc/bin/gcov-tool
# alias lto-dump=$HOME/.usr/gcc/bin/lto-dump
# alias x86_64-pc-linux-gnu-c++=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-c++
# alias x86_64-pc-linux-gnu-g++=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-g++
# alias x86_64-pc-linux-gnu-gcc=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc
# alias x86_64-pc-linux-gnu-gcc-10.3.0=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc-10.3.0
# alias x86_64-pc-linux-gnu-gcc-ar=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc-ar
# alias x86_64-pc-linux-gnu-gccgo=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gccgo
# alias x86_64-pc-linux-gnu-gcc-nm=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc-nm
# alias x86_64-pc-linux-gnu-gcc-ranlib=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc-ranlib

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

alias history="history -i 0"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ftmux="fzf-tmux -p 60%,50%"

alias fstmux="find * | fzf-tmux -p 60%,50% --prompt 'All> ' \
             --header 'CTRL-D: Directories / CTRL-F: Files' \
             --bind 'ctrl-d:change-prompt(Directories> )+reload(find * -type d)' \
             --bind 'ctrl-f:change-prompt(Files> )+reload(find * -type f)'
             "

alias fvim="fzf --print0 | xargs -0 -o vim"

alias fmvim="fzf -m --print0 | xargs -0 -o vim"
