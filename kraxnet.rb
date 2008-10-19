require 'rubygems'
require 'sinatra'
 
get '/' do
  redirect "/sluzby"
end

get '/:id' do
  erb params[:id].gsub(/-/,'').to_sym
end
