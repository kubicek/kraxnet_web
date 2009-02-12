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

helpers do

  def human_date(datetime)
    datetime.strftime('%d|%m|%Y').gsub(/([^0-9]+)0{1}(\d{1})/, '\1\2')
  end

  def truncate(chars, limit = 50)
    chars.size > limit ? chars.to_s[0...limit] + '&hellip;' : chars
  end

  def css_class_for_menuitem(id=nil)
    'active' if params[:id].to_s == id.to_s
  end

end

get '/' do
  @blog_items = Kraxnet::BlogFeed.load[0...3]
  erb :index
end

get '/novinky' do
  @blog_items = Kraxnet::BlogFeed.load
  @page_title = "Novinky"
  params[:id] = 'novinky'
  erb :novinky
end

get '/:id' do
  erb params[:id].gsub(/-/,'').to_sym
end

