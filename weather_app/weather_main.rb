require './help_weather'
require './get_weather'
require './view_weather'

class TodayWeatherViewer
  extend Screen
  extend WeatherDataCollector
  extend Usage

  def initialize(option, area = '東京')
    @mode = ['help', 'area']
    @option = option
    @area = area
  end

  def exec
    raise 'オプションがありません' unless @mode.include?(@option)

    if @option == 'help' then
      TodayWeatherViewer.help
    else
      collected_weathers = TodayWeatherViewer.exec(@area)
      raise '取得に失敗しました' unless collected_weathers
      TodayWeatherViewer.view_weathers(collected_weathers['list'])
    end
  end
end

if ARGV.size == 0 then
  input_option = 'help'
else
  input_option = ARGV[0]
end
today_weather_viewer = TodayWeatherViewer.new(input_option, ARGV[1])
today_weather_viewer.exec
