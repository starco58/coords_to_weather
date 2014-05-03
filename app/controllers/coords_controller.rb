require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates
    @address = "the corner of foster and sheridan"
    @url_safe_address = URI.encode(@address)

    # Your code goes here.
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
  end
end

class CoordsController < ApplicationController
  def fetch_weather
    # @latitude = 42.0538387
    # @longitude = -87.67721
    your_api_key = "2e4265c5279b734f4e9bb29d3786bf9a"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/#{your_api_key}/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]
    # @weekly_summary = parsed_data["weekly"]["summary"]
  end
end
