#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
service "iptables" do
        action [:stop, :disable]
end
package "httpd" do
        action :install
end
service "httpd" do
        action [:start, :enable]
end
package "mod_ssl" do
        action :install
end
package "openssl" do
        action :install
end
template "httpd.conf" do
        path "/etc/httpd/conf/httpd.conf"
        source "httpd.conf.erb"
        mode 0644
end
template "ssl.conf" do
        path "/etc/httpd/conf.d/ssl.conf"
        source "ssl.conf.erb"
        mode 0644
        notifies :restart, 'service[httpd]'
end
