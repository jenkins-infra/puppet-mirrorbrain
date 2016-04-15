require 'spec_helper'

describe 'mirrorbrain::debian' do
  it { should contain_class('mirrorbrain::debian') }
  it { should contain_class 'apt' }

  context 'apt GPG key' do
    it 'should install the appropriate key for the Apache repo on OBS' do
      expect(subject).to contain_apt__key('apacheobs').with({
        :server => 'pgp.mit.edu',
        :id => 'EDDDC98D96A0F8899AB07C789584A164BD6D129A',
      })
    end
  end

  context 'an apt repository' do
  end
end
