require 'rubygems'
require 'oauth'
require 'httparty'
require "pry"
require "json"

consumer_key = 'mZJKmCuodFzRNL9xe2WoBw'
consumer_secret = 'zPk7cjM3zCkny1326X007gQnRKE'
token = 'fbijCzcyCqJb84Kf2GIr_f1ziEwEz_4B'
token_secret = 'ydJXJalXD676NiYXE150dn1aAjo'

api_host = 'api.yelp.com'

consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
access_token = OAuth::AccessToken.new(consumer, token, token_secret)

def time_path
   t = Time.now
   if 2 < t.hour && t.hour < 12
    puts "it's morning"
    #path = "/v2/search?term=coffee&ll=37.788022,-122.399797&limit=10&sort=1"
   elsif 12 < t.hour && t.hour < 15
    puts "it's lunchtime"
    #path = "/v2/search?term=food&ll=37.788022,-122.399797&limit=10&sort=1"
   else
    puts "it's time to drink.. evening"
    #path = "/v2/search?term=bars&ll=37.788022,-122.399797&limit=10&sort=1"
   end
 #return path
end

path = "/v2/search?term=bars&ll=37.788022,-122.399797&limit=10&sort=1"

time_path()

p = JSON(access_token.get(path).body)

biz = []

p.each {|x| biz << x }

binding.pry

# "distance" from  lat long in meters
# "mobile_url" links back to yelp review for mobile_url
# "url" links back to yelp review on website
# "snippet_text" top review snippet_text
# "image_url" image of business
# "display_address"=>
#      ["46 Minna St",
#       "(b/t 2nd St & Shaw Aly)",
#       "Financial District",
#       "San Francisco, CA 94105"],
# "rating_img_url_small"  image of yelp ratings

# sort biz array by distance.. then extract content from the first 10 results
# array sort method ascending:
# array.sort! { |first, second| first <=> second }