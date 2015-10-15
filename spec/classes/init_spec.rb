require 'spec_helper'
describe 'squeezeboxserver' do

  context 'with defaults for all parameters' do
    it { should contain_class('squeezeboxserver') }
  end
end
