require 'rubygems'
require 'sinatra'

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => ENV['RACK_ENV']
)

log = File.new("log/sinatra.log", "w")
STDOUT.reopen(log)
STDERR.reopen(log)

require 'kraxnet'
run Sinatra.application