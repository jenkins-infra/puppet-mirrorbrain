require 'spec_helper'

describe 'mirrorbrain::debian' do
  it { should contain_class('mirrorbrain::debian') }
  it { should contain_class 'apt' }

  context 'an apt repository' do
    it 'should include the Apache OBS repository' do
      expect(subject).to contain_apt__source('apache-obs').with({
        :location => 'http://download.opensuse.org/repositories/Apache:/MirrorBrain/xUbuntu_12.04/',
        :repos => '/',
        :key => {
          'server' => 'pgp.mit.edu',
          'id' => 'EDDDC98D96A0F8899AB07C789584A164BD6D129A',
        },
      })
    end
  end
end
