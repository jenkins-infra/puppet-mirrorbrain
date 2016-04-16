require 'spec_helper_acceptance'

describe 'mirrorbrain class' do
  let(:manifest) { 'include mirrorbrain' }

  it 'should run without errors' do
    result = apply_manifest(manifest)
    expect(@result.exit_code).to eq 2
  end
end
