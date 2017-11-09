require 'serverspec'
require 'net/ssh'

set :backend, :ssh

begin
  require 'highline/import'
rescue LoadError
  fail "highline is not available. Try installing it."
end
set :sudo_password, ask("Enter sudo password: ") { |q| q.echo = false }

host = ENV['TARGET_HOST']

options = Net::SSH::Config.for(host)

options[:user] ||= Etc.getlogin

set :host,        options[:host_name] || host
set :ssh_options, options
