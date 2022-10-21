# vim_config
### 支持centos 系统
vim for c/c++、golang、 python、shell

安装方法与步骤：阅读install.sh

### ubuntu 系统
###### 1. 安装gcc
apt update  
apt install build-essential  
apt-get install manpages-dev  
###### 2. 安装python2和pip2  
apt install python2   
apt install python-pip  
###### 3. 安装tmux
apt install tmux  
  #解除Ctrl+b 与前缀的对应关系
  unbind C-b

  #设置前缀为ALT + w
  set -g prefix M-w

  #将r 设置为加载配置文件，并显示"reloaded!"信息
  bind r source-file ~/.tmux.conf \; display "Reloaded!"

  #Moving between panes with prefix-h, j, k, l
  #up
  bind-key k select-pane -U
  #down
  bind-key j select-pane -D
  #left
  bind-key h select-pane -L
  #right
  bind-key l select-pane -R

  #ALT 键 + hjkl 选中窗口
  bind -n M-h select-pane -L
  bind -n M-l select-pane -R
  bind -n M-j select-pane -U
  bind -n M-k select-pane -D

  #Mouse support
  set -g mouse on
  #setw -g mode-keys vi

  #Set the default terminal terminfo
  #set -g default-terminal "xterm"
  set -g default-terminal "xterm-256color"
  #set -g default-terminal "tmux-256color"
  #True colour support
  set -as terminal-overrides ",xterm*:Tc"
  #set-option -ga terminal-overrides ",xterm:Tc"

  #设置状态栏到顶部
  set-option -g status-position top
  #Set the status line's color
  #set -g status-style fg=white,bg=purple
  set -g status-style fg=black,bg=cyan

  #Set the color of the window list
  #setw -g window-status-style fg=blue,bold

  #Set the color of the active window
  #setw -g window-status-current-style fg=white,bold,bg=red


