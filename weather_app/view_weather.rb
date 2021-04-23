require './ascii'
require './color_sequence'

module Screen
  include ColorSequence
  include Ascii_art

  def view_weathers(collected_weathers_list)
    puts "#{BOLD}本日の天気#{ALLOFF}"
    (0..4).each do |time|
      puts "時刻：#{collected_weathers_list[time]['dt_txt']}"
      case collected_weathers_list[time]['weather'][0]['main']
      when 'Clear' then
        puts YELLOW
        sunny_art
      when 'Clouds' then
        puts BLUE
        croud_art
      when 'Rain' then
        puts BLUE
        rain_art
      when 'Snow' then
        puts BOLD
        snow_art
      else
        puts "#{RED}対応していません"
      end
      print <<~EOB
      #{ALLOFF}
      #{BOLD}
      天気: #{collected_weathers_list[time]['weather'][0]['description']}
      雲量: #{collected_weathers_list[time]['clouds']['all']}
      #{YELLOW}
      気温: 最低：#{collected_weathers_list[time]['main']['temp_min']}℃
      　　　最高：#{collected_weathers_list[time]['main']['temp_max']}℃
      体感温度: #{collected_weathers_list[time]['main']['feels_like']}℃
      #{BLUE}
      湿度: #{collected_weathers_list[time]['main']['humidity']}%
      #{GREEN}
      風速: #{collected_weathers_list[time]['wind']['speed']}km/h
      風向：#{set_direction(collected_weathers_list[time]['wind']['deg'])}
      #{ALLOFF}
      EOB
    end
  end

  def set_direction(direction)
    case
    when direction.to_i < 45 || direction.to_i > 315 then
      '北'
    when direction.to_i >= 45 && direction.to_i < 135 then
      '東'
    when direction.to_i >= 135 && direction.to_i < 225 then
      '南'
    else
      '西'
    end
  end

end
