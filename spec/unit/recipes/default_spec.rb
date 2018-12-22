#
# Cookbook:: codenamephp_apache2
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'codenamephp_apache2::default' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes apt recipe' do
      expect(chef_run).to include_recipe('apt')
    end

    it 'installs apache using default recipe' do
      expect(chef_run).to include_recipe('apache2::default')
    end

    it 'installs ssl using mod_ssl recipe' do
      expect(chef_run).to include_recipe('apache2::mod_ssl')
    end
  end
end
