# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def japanese_greeting(name)
    greeting = case Time.now.hour
      when 0..4:   " 今晩は"        # Good evening
      when 5..12:  " お早うございます"   # Good morning
      when 13..19: " 今日は"        # Good afternoon
      when 20..23: " 今晩は"        # Good evening     
    end
    "#{greeting}, #{name}!"
  end
end
