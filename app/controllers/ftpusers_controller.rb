class FtpusersController < ApplicationController

  make_resourceful do
    actions :all
    
    before :new, :create, :edit, :update do
      @servers  = Server.all.collect {|server| [server.name.to_s, server.id.to_s] }
      @users    = User.all.collect {|user| ["#{user.login.to_s} (#{user.name.to_s})", user.id.to_s] }
    end
  end

end
