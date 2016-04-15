require 'spec_helper'

describe 'mirrorbrain' do
  context 'with defaults for all parameters' do
    it { should contain_class('mirrorbrain') }
  end

  context 'with a non-Debian $::osfamily' do
    let(:facts) do
      {
        :osfamily => 'Redhat',
      }
    end

    it 'should fail to compile' do
      expect(subject).to raise_error(Puppet::Error)
    end
  end
end
