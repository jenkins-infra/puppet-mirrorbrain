require 'spec_helper'

describe 'mirrorbrain::debian' do
  it { should contain_class('mirrorbrain::debian') }
  it { should contain_class 'apt' }

  context 'an apt repository' do
    it 'should include the Apache OBS repository' do
      expect(subject).to contain_apt__source('apache-obs').with({
        :location => 'http://download.opensuse.org/repositories/home:/agentdero:/mirrorbrain/xUbuntu_14.04',
        :repos => '/',
        :key => {
          'server' => 'pgp.mit.edu',
          'id' => '77F11CCF1AFBE15388CE93239FAAEC7EA5638A16'
        },
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
end
