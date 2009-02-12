require 'rubygems'
require 'sinatra'
require 'open-uri'
require 'rss'

module Kraxnet
  class BlogFeed
    FEED_URL = 'http://blog.xnet.cz/feed/'
    def self.load
      open(FEED_URL) { |http| RSS::Parser.parse(http.read, false).items[0..10] }
    end
  end
end

get '/' do
  erb :index
end

get '/novinky' do
  @blog_items = Kraxnet::BlogFeed.load
  @page_title = "Novinky"
  erb :rss_reader
end

get '/:id' do
  erb params[:id].gsub(/-/,'').to_sym
end

