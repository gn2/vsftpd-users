class Group < ActiveRecord::Base
  is_paranoid
  
  has_and_belongs_to_many :users
  has_many :ftpusers
end
