#
# Cookbook:: interfaces
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'interfaces::default' do
  context 'When all attributes are default, on Ubuntu 20.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '20.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  context 'When all attributes are default, on CentOS 8' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'centos', '8'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end

  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'centos', version: '8').converge('interfaces') }

  it 'installs httpd' do
    expect(chef_run).to install_package('httpd')
  end
  
  it 'creates index.html template' do
    expect(chef_run).to create_template('/var/www/html/index.html')
  end

  it 'starts httpd service' do
    expect(chef_run).to start_service('httpd')
  end

  it 'creates interfaces.txt file' do
    expect(chef_run).to create_file('/tmp/interfaces.txt')
  end

end
