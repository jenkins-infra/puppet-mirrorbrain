require 'spec_helper'

describe 'mirrorbrain::debian' do
  it { should contain_class('mirrorbrain::debian') }
  it { should contain_class 'apt' }

  context 'an apt repository' do
    it 'should include our apt::key' do
      expect(subject).to contain_apt__key('apache-mirrorbrain-obs').with({
        :server => 'pgp.mit.edu',
        :id => '77F11CCF1AFBE15388CE93239FAAEC7EA5638A16'
      })
    end

    it 'should include the mirrorbrain repository' do
      expect(subject).to contain_file('/etc/apt/sources.list.d/apache-mirrorbrain-obs.list').with({
        :content => 'deb http://download.opensuse.org/repositories/home:/agentdero:/mirrorbrain/xUbuntu_14.04 /',
        :notify => 'Exec[apt_update]',

      })
    end
  end


  context 'mirrorbrain command line tooling' do
    it { should contain_package 'mirrorbrain' }
    it { should contain_package 'mirrorbrain-tools' }
    it { should contain_package 'mirrorbrain-scanner' }
  end

  context 'geoip packaging' do
    it { should contain_package 'geoip-bin' }
    it { should contain_package 'geoip-database' }
  end

  it { should contain_package 'mirmon' }
end
