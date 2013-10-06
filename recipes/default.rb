#
# Cookbook Name:: ssh-ldap
# Recipe:: default
#
# Copyright 2013, OSU Open Source Lab
#
# All rights reserved - Do Not Redistribute
#
include_recipe "openssh"

# Manage ldap configuration
%w{openssh-ldap pam_ldap nss-pam-ldapd openldap-clients nscd}.each do |pkg|
  package pkg do
    action :install
  end
end

template "/etc/pam_ldap.conf" do
  source "pam_ldap.conf.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[nscd]"
end

template "/etc/nslcd.conf" do
  source "nslcd.conf.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[nslcd]"
end

template "/etc/openldap/ldap.conf" do
  source "openldap.conf.erb"
  mode 0644
  owner "root"
  group "root"
end

template "/etc/ssh/ldap.conf" do
  source "ldap.conf.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[ssh]"
  notifies :restart, "service[nscd]"
  notifies :restart, "service[nslcd]"
end

service "nscd" do
  action [:start,:enable]
end

service "nslcd" do
  action [:start,:enable]
end
