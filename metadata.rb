# frozen_string_literal: true

name 'codenamephp_apache2'
maintainer 'Bastian Schwarz'
maintainer_email 'bastian@codename-php.de'
license 'Apache-2.0'
description 'Cookbook to install apache2'
version '2.0.0'
chef_version '>= 13.0'
issues_url 'https://github.com/codenamephp/chef.cookbook.apache2/issues'
source_url 'https://github.com/codenamephp/chef.cookbook.apache2'

supports 'debian'

depends 'apt'
depends 'apache2', '~> 8.0'
