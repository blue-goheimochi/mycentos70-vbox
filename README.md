CentOS6.5のboxファイルをベースにして、  
`yum update`など時間がかかる処理や初期設定をした状態で、  
boxファイルとして保存する。

## Install

boxファイルを作成＆登録する。

    $ vagrant up
    $ vagrant ssh

    (vagrant) $ sudo ln -s -f /dev/null/etc/udev/rules.d/70-persistent-net.rules
    (vagrant) $ exit

    $ vagrant halt
    $ rm -rf package.box
    $ vagrant package
    $ vagrant box remove mycentos65-vbox
    $ vagrant box add mycentos65-vbox package.box

## Usage

Vagrantfileでboxファイルを指定する。

    config.vm.box = "mycentos65-vbox"
