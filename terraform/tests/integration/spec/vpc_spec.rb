require 'spec_helper'

describe vpc('pub-vpc'), region: 'us-east-1' do
  it { should exist }
end