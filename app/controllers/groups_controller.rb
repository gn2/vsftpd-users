class GroupsController < ApplicationController
  before_filter :require_admin
  
  make_resourceful do
    actions :all
  end
end
