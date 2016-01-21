# phpms_cus

こちらのサイトを非常に参考にさせていただく

[こちら](http://shusatoo.net/infra/chef/vagrant-chef-solo-php-mysql-development-environment/)

* apache 2.2.15
* mysql 5.6.28
* php 5.6.17

## Usage

以下のものはインストール済想定(バージョンは動作確認したもの)

* Vagrant 1.7.4
* VirtualBox 5.0.2
* git 1.9.5

### Step

以下windows環境想定(コマンドプロンプト) MacOSでもほぼ一緒

1. 任意フォルダ作成 c:\vagrant とします
1. cd c\vagrant
1. git　clone https://github.com/kugiadoya/phpms_cus.git
1. cd phpms_cus
1. vagrant up

### Specifications

* HostPCのhostsに192.168.33.10 phpms.vmを追加すればhttp://phpms.vmでアクセス可能
* 上記のバーチャルホスト設定

```
<VirtualHost *:80>
    ServerName phpms.vm
    DocumentRoot /var/www/src/phpms/public
    <Directory /var/www/src/phpms/public>
        Options All
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>
```

* HostPCからGuestPCのMySQLにアクセス可能(ただしHostにMySQLクライアントインストール済)

```
mysql -h 192.168.33.10 -u root -proot
```