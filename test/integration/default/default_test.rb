describe service('httpd') do
  it { should be_enabled }
  it { should be_installed }
  it { should be_running }
end
describe file('/var/www/html/index.html') do
  its('mode') { should cmp '0755' }
end
