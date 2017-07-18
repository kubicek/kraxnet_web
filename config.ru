require 'rubygems'
require 'sinatra'

set(:run, false)
set(:env, ENV['RACK_ENV'])
set(:views, './views')

# log = File.new("log/sinatra.log", "w")
# STDOUT.reopen(log)
# STDERR.reopen(log)

require 'kraxnet'
run Sinatra::Application
