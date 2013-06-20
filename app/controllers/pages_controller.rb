class PagesController < ApplicationController
  def index

    consumer_key = 'mZJKmCuodFzRNL9xe2WoBw'
    consumer_secret = 'zPk7cjM3zCkny1326X007gQnRKE'
    token = 'fbijCzcyCqJb84Kf2GIr_f1ziEwEz_4B'
    token_secret = 'ydJXJalXD676NiYXE150dn1aAjo'

    api_host = 'api.yelp.com'

    consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {:site => "http://#{api_host}"})
    access_token = OAuth::AccessToken.new(consumer, token, token_secret)

    def time_path
       t = Time.now.hour
       if 2 < t && t < 12
        path = "/v2/search?term=coffee&ll=37.779751,-122.394783&limit=10&sort=1"
       elsif 12 < t && t < 15
        path = "/v2/search?term=food&ll=37.779751,-122.394783&limit=10&sort=1"
       else
         path = "/v2/search?term=bars&ll=37.779751,-122.394783&limit=10&sort=1"
       end
      return path
    end


    path = time_path()


    p = JSON(access_token.get(path).body)





    path = "/v2/search?term=bars&ll=37.779751,-122.394783&limit=5&sort=1"


    @results = []
    p["businesses"].each do |business|
      @results << Geocoder.coordinates(business["location"]["display_address"].join(", "))
    end

    @display = p["businesses"]

  end
end
