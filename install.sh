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
#1.将vim_tool.tar.bz2包放到用户的家目录下解压 tar -jxvf
    下载地址 百度云链接：https://pan.baidu.com/s/1xmASXXm46SO7Jcvpcrto9Q:7777 
    # 安装好vim_tool(vim8.2 和 gcc10) 之后用git仓库中的.vimrc 和 .bashrc 覆盖用户家目录下的
    下载 vim_config.tar.gz(插件) 放到用户家目录下解压安装
    链接：https://pan.baidu.com/s/1pJfXjn7_HYZjLOmnrqjjUQ 
    提取码：7777 

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
    #或者将 pygments.tar.gz 的包放到/usr/lib/python2.7/site-packages/pygments 目录下解压

#5.解决vim依赖库 ./vim_depend_lib 目录下存放了一些动态库供选择
    ldd .usr/vim/bin/vim   
    #在用户家目录下的 .usr 目录中创建 lib 目录，将not find的库拷贝到 ~/.usr/lib 目录下   注意：只拷贝not find的
    在 /etc/ld.so.conf 文件中添加  /home/lc/.usr/lib/  /home/lc/.usr/gcc/lib64/

#6.解决ycm的依赖库
    sudo rm /usr/lib64/libstdc++.so.6
    sudo cp $HOME/.usr/gcc/lib64/libstdc++.so.6.0.28 /usr/lib64/
    sudo ln -s /usr/lib64/libstdc++.so.6.0.28 /usr/lib64/libstdc++.so.6

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
    pip3 install flake8  #用压缩包安装有点麻烦，依赖的有点多。后续有时间可以整理一下相关库的压缩包

#11.安装ctags
    yum install ctags

#11.收尾
    sudo ldconfig
    source ~/.bashrc
