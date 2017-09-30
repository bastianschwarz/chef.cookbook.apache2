#
# Cookbook:: chef.cookbook.apache2
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'apache2'

if node['apache']['default_site_enabled'] == true
  apache_site "default-ssl"
end
