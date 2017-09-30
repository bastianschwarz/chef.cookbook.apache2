#
# Cookbook:: chef.cookbook.apache2
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'chef.cookbook.apache2::default' do
  context 'When all attributes are default' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
      stub_command("/usr/sbin/apache2 -t").and_return(true)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'includes apt recipe' do
      expect(chef_run).to include_recipe('apt')
    end
    it 'includes apache2 recipe' do
      expect(chef_run).to include_recipe('apache2')
    end
  end

  context 'When default_site_enabled is set to false' do
    let(:chef_run) do
      runner = ChefSpec::SoloRunner.new
      runner.converge(described_recipe)
    end

    before do
      stub_command("/usr/sbin/apache2 -t").and_return(true)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'enables default ssl site' do
      expect(chef_run).to enable_site('default-ssl')
    end
  end
end
