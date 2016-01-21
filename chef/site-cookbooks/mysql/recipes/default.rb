#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
remote_file "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-5.noarch.rpm" do
	source 'http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm'
	action :create
end

rpm_package "mysql-community-release" do
	source "#{Chef::Config[:file_cache_path]}/mysql-community-release-el6-5.noarch.rpm"
	action :install
end

# MySQLインストール
yum_package "mysql-community-server" do
	action :install
	flush_cache [:before]
	notifies :run, 'execute[mysqladmin]'
	notifies :run, 'execute[mysql]'
end

# root pass変更
execute 'mysqladmin' do
	action :nothing
	command 'mysqladmin password -u root ' + node['mysql']['password']
end

# host接続許可
execute 'mysql' do
	action :nothing
	command "mysql -u root -p#{node['mysql']['password']} -e \"GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '#{node['mysql']['password']}' WITH GRANT OPTION\""
end

# サービス有効化とスタート
service "mysqld" do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start ]
end

# テンプレート反映
template '/etc/my.cnf' do
	source "my.cnf.erb"
	notifies :restart, 'service[mysqld]'
end
