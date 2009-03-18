require 'rubygems'
require 'sinatra'

Sinatra::Default.set(:run, false)
Sinatra::Default.set(:env, ENV['RACK_ENV'])
Sinatra::Default.set(:views, './views')

# log = File.new("log/sinatra.log", "w")
# STDOUT.reopen(log)
# STDERR.reopen(log)

require 'kraxnet'
run Sinatra::Application