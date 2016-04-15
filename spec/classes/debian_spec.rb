require 'spec_helper'

describe 'mirrorbrain::debian' do
  it { should contain_class('mirrorbrain::debian') }
  it { should contain_class 'apt' }
end
