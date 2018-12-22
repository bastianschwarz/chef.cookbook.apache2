#
# Cookbook:: codenamephp_apache2
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'apache2::default'
include_recipe 'apache2::mod_ssl'

apache_site 'default-ssl'
apache_conf 'default_access'
