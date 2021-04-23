module Usage
  def help
    puts <<~EOB
    [usage]
    天気情報を取得し、表示するコマンド
    help : ヘルプ情報の表示
    area [location] : 指定の地域を入力するとその範囲で表示。デフォルトは東京です。
    ex) ruby weather_main.rb area '京都'
    EOB
  end
end
