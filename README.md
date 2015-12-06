# phpms_cus

こちらのサイトを非常に参考にさせていただく

[こちら](http://shusatoo.net/infra/chef/vagrant-chef-solo-php-mysql-development-environment/)

* apache
* mysql
* php 5.6

## Usage

以下のものはインストール済想定

* Vagrant
* VirtualBox
* knife-solo ``gem install knife-solo``

### 手順

1. gitでclone
1. vagrant up
1. vagrant ssh-config --host phpms >> ~/.ssh/config
1. cd chef
1. knife-solo bootstrap phpms

一旦ここまで

