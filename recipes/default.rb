package 'httpd' do
  package_name 'httpd'
end

template "/var/www/html/index.html" do
  source 'index.html.erb'
  mode '0755'
  notifies :restart, 'service[httpd]'
end

service 'httpd' do
  action [:start, :enable]
end

file '/tmp/interfaces.txt' do
  content node["network"]["interfaces"].to_s
end
