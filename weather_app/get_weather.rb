require 'net/http'
require 'json'
require 'uri'

module WeatherDataCollector

  OPENWEATHERMAP_API_KEY = '49dc40be77aaa5a887fceaaf64765535'
  OPENWEATHERMAP_PATH = 'https://api.openweathermap.org/data/2.5/forecast'
  YAHOO_API_KEY = 'dj00aiZpPWFCanNha2dwNlBWbiZzPWNvbnN1bWVyc2VjcmV0Jng9YzQ-'
  GEOCODE_PATH = 'https://map.yahooapis.jp/geocode/V1/geoCoder'

  def exec(area)
    params = {
      'appid' => YAHOO_API_KEY,
      'query' => area,
      'results' => '1',
      'output' => 'json',
    }
    geocode_response = Net::HTTP.get_response(URI.parse(GEOCODE_PATH + '?' + URI.encode_www_form(params)))
    lon , lat = JSON.parse(geocode_response.body)['Feature'][0]['Geometry']['Coordinates'].split(',')

    response = Net::HTTP.get_response(URI.parse("#{OPENWEATHERMAP_PATH}?lat=#{lat}&lon=#{lon}&units=metric&
    output=json&lang=ja&APPID=#{OPENWEATHERMAP_API_KEY}"))
    JSON.parse(response.body)
  end
end
