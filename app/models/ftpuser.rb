require "digest/md5"

class Ftpuser < ActiveRecord::Base
  include AASM
  is_paranoid
  
  attr_accessor :password, :password_confirmation
  
  # Validations
  validates_presence_of :login, :server, :group
  validates_uniqueness_of :login
  #validates_presence_of :crypted_password, :message => "Password is too short (minimum is 6 characters)"
  validates_length_of :password, :password_confirmation, :minimum => 6, :if => Proc.new{|user| user.password_recently_changed? || user.new_record?}
  validates_confirmation_of :password
  
  # Relationships
  belongs_to :server
  belongs_to :group
  
  delegate :users, :to => :group
  
  # AASM configuration
  aasm_column :state
  aasm_initial_state :active
  
  aasm_state :active
  aasm_state :inactive
  
  aasm_event :activate do
    transitions :to => :active, :from => :inactive
  end
  aasm_event :inactivate do
    transitions :to => :inactive, :from => :active
  end
  
  # def users_logger
  #   @@users_logger ||= Logger.new("#{RAILS_ROOT}/log/users.log")
  # end
  # users_logger.info("Change password")
  
  def update_password(params)
    @changed_password = true
    update_attributes(:password => params[:password], :password_confirmation => params[:password_confirmation])
  end

  # Some methods used by observers
  def password_recently_changed?
    @changed_password
  end
  
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    self.crypted_password = Ftpuser.crypted_password(pwd)
  end
  
  private
  def self.crypted_password(password)
    # password.length < 6 ? nil : Digest::MD5.hexdigest(password)
    Digest::MD5.hexdigest(password)
  end
end
