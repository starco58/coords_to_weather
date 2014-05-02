require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather
    @latitude = 42.0538387
    @longitude = -87.67721
    your_api_key = "2e4265c5279b734f4e9bb29d3786bf9a"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/2e4265c5279b734f4e9bb29d3786bf9a/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    # @temperature = ?
    # @minutely_summary = ?
    # @hourly_summary = ?
    # @daily_summary = ?
  end
end
