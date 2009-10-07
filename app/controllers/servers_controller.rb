class ServersController < ApplicationController
  before_filter :require_user
  
  make_resourceful do
    actions :all
    
    after :create do 
      flash[:notice] = "Yoohooo!"
    end
  
  end

end
