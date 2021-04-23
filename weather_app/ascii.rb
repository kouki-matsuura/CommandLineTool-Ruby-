module Ascii_art
  def sunny_art
    puts <<~EOB
     ＼     |    /
       ＼   |   /
    　   /'''''＼
   -----|      |-----
       　＼____/
         /  |  ＼
        /   |   　＼

   ==================
    EOB
  end

  def croud_art
    puts <<~EOB
          .--.
        (     )._
      (      (   )._
    (__________(    )

    =================
    EOB
  end

  def rain_art
    puts <<~EOB
        .--.
      (     )._
    (      (   )._
    (__________(    )
     /  /  /  /  /
     / /  /  /  /
     ================
     EOB
  end

  def snow_art
    puts <<~EOB
        .--.
      (     )._
    (      (   )._
    (__________(    )
    ・　・　・　・　・
    ・　・　・　・　・
    =================
    EOB
   end
end
