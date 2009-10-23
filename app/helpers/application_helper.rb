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
  
  def nl2br(s)
    s.gsub(/(\r)?\n/, "<br />")
  end
  
  def friendly_states(state)
    img = case state
      when "pending" :   "help"
      when "inactive":   "delete"
      when "active"  :   "accept"
      when "banned"  :   "block"
      
      when "inactivate":   "delete"
      when "activate"  :   "accept"
      when "ban"  :   "block"
    end
    image_tag img+".png", :alt => state.capitalize, :title => state.capitalize
  end
end
