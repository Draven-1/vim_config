#得确保安装了 python3 git2.0以上版本

#可以连外网则尽量用官方的安装方法，比较方便。若不能连外网，则可以用压缩包安装
#TODO后续将以下步骤写为脚本，以达到一键安装的效果

##切换到 root 用户, 并且触发安装脚本
#install_user_home=$HOME
#
#function SwitchRoot() {
#  echo "为了安装依赖程序, 需要使用 root 账户. 您的密码不会被上传."
#  echo "请输入 root 密码:"
#  su -c "curl -sLf https:******** -o /tmp/start.sh && bash /tmp/start.sh $install_user_home"
#  rm -f /tmp/start.sh > /dev/null 2>&1
#}
#
##切换到 root 用户
#SwitchRoot

#源码编译vim、gcc、python3参数
    #vim 最好只支持python3 如果同时支持python3 和 python2会遇到些问题。(https://github.com/ycm-core/YouCompleteMe/issues/3635) 
    #vim：./configure --with-features=huge --enable-rubyinterp=yes --enable-luainterp=yes --enable-perlinterp=yes --enable-python3interp=yes --enable-fontset=yes --enable-cscope=yes --enable-multibyte --disable-gui --enable-fail-if-missing --prefix=$HOME/.usr/vim --with-compiledby='lichao'

    gcc：./configure --enable-languages=c,c++,go --disable-multilib --with-system-zlib --prefix=$HOME/lc/usr/gcc

    python3.6.8 ./configure --prefix=/usr/local/python3 --enable-optimizations --enable-shared 
    #python有静态加载和动态加载两种方式，我们选择动态加载，因此编译时参数打开动态链接

安装方法与步骤：
#1.将vim_gcc_too.tar.gz包放到用户的家目录下解压 
    链接：https://pan.baidu.com/s/1X6VcbfD1YUm65BI1BU-96g 
    提取码：7777 
    # 安装好vim_tool(vim8.2 和 gcc10.3) 之后用git仓库中的.vimrc 和 .bashrc 覆盖用户家目录下的
    下载 vim_config.tar.gz(插件) 放到用户家目录下解压安装
    链接：https://pan.baidu.com/s/1pJfXjn7_HYZjLOmnrqjjUQ 
    提取码：7777 
    # 如果要将vim安装到root 目录下，则在/root/.bashrc 中添加 export VIMRUNTIME=/root/.usr/vim/share/vim/vim82  (https://bbs.archlinux.org/viewtopic.php?id=143087)

#2.安装python3.6
    #将python3的包放到 /usr/local/目录下解压
    在 /etc/ld.so.conf 文件中添加  /usr/local/python3/lib/
    export PATH=$PATH:/usr/local/python3/bin 添加到 /etc/profile

#3.安装git-2.32
    #git token验证 git remote set-url origin https://token值@github.com/用户名/仓库名
    #遇到 fatal: unable to access 'https://github.com/Draven-1/vim_config.git/': Encountered end of file
    #用 git config --global --unset https.proxy 解决
    #将git的包放到 /usr/local/ 目录下解压 打开 /etc/profile 文件添加下一行内容，退出执行 source /etc/profile
    export PATH=$PATH:/usr/local/git/bin
    yum remove git #安装完卸载旧版git

#4.安装gtags-6.6.6
    #将gtags的包放到 /usr/local/ 目录下解压
    export PATH=$PATH:/usr/local/gtags/ 添加到 /etc/profile
    在 /etc/ld.so.conf 文件中添加  /usr/local/gtags/lib/
    #用pip install pygments 安装pygments(不要用pip3安装,python3对于pygments有一些bug,导致gtags不能正常使用)
    现在可以使用python3的pygments了，可以和python2的同时用。
    安装pip2  python get-pip-2.py
    #或者将 pygments.tar.gz 的包放到/usr/lib/python2.7/site-packages/pygments 目录下解压

#5.解决vim依赖库 ./vim_depend_lib 目录下存放了一些动态库供选择
    ldd .usr/vim/bin/vim   
    #在用户家目录下的 .usr 目录中创建 lib 目录，将not find的库拷贝到 ~/.usr/lib 目录下   注意：只拷贝not find的
    在 /etc/ld.so.conf 文件中添加  /home/lc/.usr/lib/  /home/lc/.usr/gcc/lib64/

#6.解决ycm的依赖库
    sudo rm /usr/lib64/libstdc++.so.6
    sudo cp $HOME/.usr/gcc/lib64/libstdc++.so.6.0.28 /usr/lib64/
    sudo ln -s /usr/lib64/libstdc++.so.6.0.28 /usr/lib64/libstdc++.so.6
    or
    ln -s /root/.usr/gcc/lib64/libstdc++.so.6.0.28 /usr/lib64/libstdc++.so.6

#7.安装golang
    https://golang.org/doc/install
    export GOROOT=/usr/local/go             设置GOROOT
    export GOPATH=/home/lc/code/golang      设置GOPATH

#8.安装ShellCheck 用于shell语法检测
    #方法一：
    yum install epel-release
    yum install ShellCheck
    #方法二：
    #用rpm 包安装

#10.安装flake8 用于python语法检测
    pip3 install flake8  #用压缩包安装有点麻烦，依赖的有点多。后续有时间可以整理一下相关库的压缩包。python3的语法检测。
    pip2 install flake8  #python2的语法检测。需要先安装pip2。
    python -m flake8 test.py
    python3 -m flake8 test.py  

#11.安装ctags
    yum install ctags
 
#12.安装tmux 和 windows安装字体
    tmux 依赖库 libevent-2.0.so.5

#13.windows中的 nvim 配置
    安装 oh-my-posh: winget install oh-my-posh 
    安装Terminal-Icons: Install-Module -Name Terminal-Icons -Repository PSGallery
    #安装nvim 设置别名vim, 安装yarn(git上下载msi) 安装nodejs(node npm) 安装vim-plug(可以用打包的文件)
    #将win_nvim.zip 解压到C:\Users\lichao\AppData\Local\  目录下
    安装vim: 官网安装，或者winget install vim 添加环境变量
    安装yarn(git上下载msi) 安装nodejs(node npm) 安装vim-plug(可以用打包的文件)
    编写C:\Program Files\Vim\_vimrc 文件(在vim 的安装目录中)
    安装vim 插件重新下载或者直接解压包vim_coc_plugs.zip
    
#14.收尾
    sudo ldconfig
    source ~/.bashrc

#15.安装zsh 和 oh my zsh
    将zsh.tar.gz 解压到/usr/local/ 添加 /usr/local/zsh/bin/zsh 到文件/etc/shells, 添加环境变量。
    chsh -s /usr/local/zsh/bin/zsh #切换默认bash
    将ohmyzsh.tar.gz 解压家目录。
  
 #16.安装vim9
    解压vim9.tar.gz到/usr/local/ 并添加环境变量
    解压vim9_lib.zip 到 ~/.lib中，修改/etc/ld.so.conf 文件添加动态库加载路径  执行 ldconfig.
    解决下面这个错误：yum install pango 
    vim: symbol lookup error: /root/vim9_lib/libpango-1.0.so.0: undefined symbol: g_log_structured_standard

 #17. vim markdown相关插件的依赖
    dnf install nodejs
    npm install --global yarn

 #18. 安装fzf和fzf.vim; tmux安装了一些插件; 安装bat代替cat(bat可以和fzf联动)
    涉及到相关的配置有.vimrc .tmux.conf .fzf.zsh .zshrc(.fzf.zsh需要改里面的目录)
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    dnf install bat
    安装搜索工具ag
    sudo dnf install the_silver_searche
    安装搜索工具rg
    sudo dnf install ripgrep 或者github下载官方编译好的二进制包(选择静态编译出来的)

#最新安装方法
    解压vim.tar.gz 和kit.tar.

    
    

