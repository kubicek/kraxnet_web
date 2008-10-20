require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'rss'
 
get '/' do
  redirect "/sluzby"
end

get '/novinky' do
  feed_url = 'http://blog.xnet.cz/feed/'
  open(feed_url) do |http|
    response = http.read
    result = RSS::Parser.parse(response, false)
    @blog_items = result.items[0..10]
  end
  @page_title = "Novinky"
  erb :rss_reader
end

get '/:id' do
  erb params[:id].gsub(/-/,'').to_sym
end

