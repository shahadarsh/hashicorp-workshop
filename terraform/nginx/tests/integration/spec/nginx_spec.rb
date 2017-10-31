require 'spec_helper'

describe security_group('sg_nginx'), region: 'us-east-1' do
  it { should exist }
end

describe ec2('nginx-0'), region: 'us-east-1' do
  it { should be_running }
  it { should have_security_group('sg_nginx') }
end

describe ec2('nginx-1'), region: 'us-east-1' do
  it { should be_running }
  it { should have_security_group('sg_nginx') }
end

describe ec2('nginx-2'), region: 'us-east-1' do
  it { should be_running }
  it { should have_security_group('sg_nginx') }
end