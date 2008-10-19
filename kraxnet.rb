#$:.unshift File.dirname(__FILE__) + '/sinatra/lib'
require 'rubygems'
require 'sinatra'
 
get '/' do
    "Hello World"
end

get '/:id' do
    erb params[:id].gsub(/-/,'').to_sym
end
