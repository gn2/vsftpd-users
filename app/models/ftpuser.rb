class Ftpuser < ActiveRecord::Base
  include AASM
  is_paranoid
  
  attr_accessor :password_confirmation
  
  # Validations
  validates_presence_of :login, :password, :server, :group
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
  aasm_state :banned
  aasm_state :deleted
  
  aasm_event :inactivate do
    transitions :to => :inactive, :from => [:passive, :pending, :verified, :active, :deleted, :banned]
  end
  aasm_event :ban do
    transitions :to => :banned, :from => [:passive, :pending, :verified, :active, :inactive, :deleted]
  end
  aasm_event :delete do
    transitions :to => :deleted, :from => [:passive, :pending, :verified, :active, :inactive, :banned]
  end
  
  def update_password(params)
    @changed_password = true
    update_attributes(:password => params[:password], :password_confirmation => params[:password_confirmation])
  end

  # Some methods used by observers
  def password_recently_changed?
    @changed_password
  end

end
