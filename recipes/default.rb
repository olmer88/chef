file '/tmp/interfaces.txt' do
  content node["network"]["interfaces"].to_s
end
