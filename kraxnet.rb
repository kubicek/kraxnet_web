#$:.unshift File.dirname(__FILE__) + '/sinatra/lib'
require 'rubygems'
require 'sinatra'
 
get '/' do
    "Hello World"
end

get '/clenstvi' do
    erb :clenstvi
end

get '/historie' do
    erb :historie
end

get '/kontakt' do
    erb :kontakt
end

get '/mise-a-vize' do
    erb :miseavize
end
 
get '/sluzby' do
    erb :sluzby
end
