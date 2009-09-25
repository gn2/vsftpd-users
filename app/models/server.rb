class Server < ActiveRecord::Base
  is_paranoid
  
  has_many :ftpusers
end
