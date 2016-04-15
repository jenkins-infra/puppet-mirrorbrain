require 'spec_helper'

describe 'mirrorbrain::apache' do
  context 'with defaults for all parameters' do
    it { should contain_class('mirrorbrain::apache') }

    it { should contain_class 'apache' }
  end
end
