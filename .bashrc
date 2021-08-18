# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export LD_LIBRARY_PATH=$HOME/.usr/gcc/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/.usr/gcc/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/.usr/gcc/libexec:$LD_LIBRARY_PATH

#vim
alias vim=$HOME/.usr/vim/bin/vim
alias vimdiff=$HOME/.usr/vim/bin/vimdiff
alias vimtutor=$HOME/.usr/vim/bin/vimtutor
alias ex=$HOME/.usr/vim/bin/ex
#alias rview=$HOME/.usr/vim/bin/rview
#alias view=$HOME/.usr/vim/bin/view
#alias xxd=$HOME/.usr/vim/bin/xxd
#alias rvim=$HOME/.usr/vim/bin/rvim

#gcc
alias c++=$HOME/.usr/gcc/bin/c++
alias cpp=$HOME/.usr/gcc/bin/cpp
alias g++=$HOME/.usr/gcc/bin/g++
alias gcc=$HOME/.usr/gcc/bin/gcc
alias gcc-ar=$HOME/.usr/gcc/bin/gcc-ar
alias gccgo=$HOME/.usr/gcc/bin/gccgo
alias gcc-nm=$HOME/.usr/gcc/bin/gcc-nm
alias gcc-ranlib=$HOME/.usr/gcc/bin/gcc-ranlib
alias gcov=$HOME/.usr/gcc/bin/gcov
alias gcov-dump=$HOME/.usr/gcc/bin/gcov-dump
alias gcov-tool=$HOME/.usr/gcc/bin/gcov-tool
alias lto-dump=$HOME/.usr/gcc/bin/lto-dump
#alias x86_64-pc-linux-gnu-c++=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-c++
#alias x86_64-pc-linux-gnu-g++=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-g++
#alias x86_64-pc-linux-gnu-gcc=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc
#alias x86_64-pc-linux-gnu-gcc-10.3.0=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc-10.3.0
#alias x86_64-pc-linux-gnu-gcc-ar=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc-ar
#alias x86_64-pc-linux-gnu-gccgo=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gccgo
#alias x86_64-pc-linux-gnu-gcc-nm=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc-nm
#alias x86_64-pc-linux-gnu-gcc-ranlib=$HOME/.usr/gcc/bin/x86_64-pc-linux-gnu-gcc-ranlib
