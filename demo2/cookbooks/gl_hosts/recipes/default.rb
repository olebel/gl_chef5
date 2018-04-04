#
# Cookbook:: gl_hosts
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

hostsfile_entry '10.1.1.10' do
  hostname  'workstation.local'
  aliases   ['workstation']
  unique    true
end

hostsfile_entry '10.1.1.20' do
  hostname  'node2.local'
  aliases ['node2']
  unique    true
end
