class Group < ActiveRecord::Base
  is_paranoid
  
  validates_presence_of :name, :description
  
  has_and_belongs_to_many :users
  has_many :ftpusers, :dependent => :destroy
  
end
