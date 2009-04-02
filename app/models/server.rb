class Server < ActiveRecord::Base
  is_paranoid
  has_many :ftp_users
end
