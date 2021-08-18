#!/usr/bin/sh
#得确保安装了 python3 git2.0以上版本
#安装git-lfs
#sudo yum install git-lfs
#git lfs install 开启lfs功能
#git lfs track + 大文件名称

##切换到 root 用户, 并且触发安装脚本
#install_user_home=$HOME
#
#function SwitchRoot() {
#  echo "为了安装依赖程序, 需要使用 root 账户. 您的密码不会被上传."
#  echo "请输入 root 密码:"
#  su -c "curl -sLf https://gitee.com/raw/master/start.sh -o /tmp/start.sh && bash /tmp/start.sh $install_user_home"
#  rm -f /tmp/start.sh > /dev/null 2>&1
#}
#
##切换到 root 用户
#SwitchRoot

#1.将code_vim.tgz包放到用户的家目录下解压

#2.安装python3.6
    #将python3的包放到 /usr/local/目录下解压
    在 /etc/ld.so.conf 文件中添加  /usr/local/python3/lib/
    export PATH=$PATH:/usr/local/python3/ 添加到 /etc/profile
    #创建软连接：
    #vim 编译时的python3配置路径
    ln -s /usr/local/python3/lib/python3.6/config-3.6m-x86_64-linux-gnu  /usr/lib64/python3.6/config-3.6m-x86_64-linux-gnu

#3.安装git-2.32
    #git token验证 git remote set-url origin https://token值@github.com/用户名/仓库名
    #将git的包放到 /usr/local/ 目录下解压 打开 /etc/profile 文件添加下一行内容，退出执行 source /etc/profile
    export PATH=$PATH:/usr/local/git/

#4.安装gtags-6.6.6
    #将gtags的包放到 /usr/local/ 目录下解压
    export PATH=$PATH:/usr/local/gtags/ 添加到 /etc/profile
    在 /etc/ld.so.conf 文件中添加  /usr/local/gtags/lib/

#5.TODO将vim依赖的库拷贝一份，最后拷贝到 /lib64/ 目录下
    #ldd .usr/vim/bin/vim  

#6.解决ycm的依赖库
    sudo rm /usr/lib64/libstdc++.so.6
    sudo cp $HOME/.usr/gcc/lib64/libstdc++.so.6.0.28 /usr/lib64/
    sudo ln -s /usr/lib64/libstdc++.so.6.0.28 /usr/lib64/libstdc++.so.6

#7.收尾
    sudo ldconfig
    source ~/.bashrc
