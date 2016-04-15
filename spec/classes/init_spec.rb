require 'spec_helper'
describe 'mirrorbrain' do

  context 'with defaults for all parameters' do
    it { should contain_class('mirrorbrain') }
  end
end
