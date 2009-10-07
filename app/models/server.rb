class Server < ActiveRecord::Base
  is_paranoid
  
  validates_presence_of :name, :description, :ip_address
  validates_format_of :ip_address, :with => /^((\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.){3}(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
  
  has_many :ftpusers
  
end
