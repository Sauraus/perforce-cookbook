require 'serverspec'
set :backend, :exec

describe service('snmpd') do
  it { should be_enabled.with_level(2) }
  it { should be_enabled.with_level(3) }
  it { should be_enabled.with_level(4) }
  it { should be_enabled.with_level(5) }
  it { should be_running }
end

describe file('/opt/perforce/p4') do
  it { should contain 'com2sec localsec  localhost  PLayD0me'}
  it { should contain 'group zenoss_general_group  v1  zenoss-general' }
  it { should contain 'group zenoss_compliant_group  v1  zenoss-compliant' }
end
