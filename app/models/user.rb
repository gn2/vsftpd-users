class User < ActiveRecord::Base
  include AASM
  acts_as_authentic
  is_paranoid

  attr_accessible :name, :login, :email, :password
  
  # Validations
  validates_presence_of :first_name
  
  # Relationships
  has_many :ftp_users
  
  # AASM configuration
  aasm_column :state
  aasm_initial_state :pending
  
  aasm_state :pending
  aasm_state :active
  aasm_state :inactive
  aasm_state :banned
  aasm_state :deleted
  
  aasm_event :activate do
    transitions :to => :active, :from => [:pending, :inactive]
  end
  aasm_event :inactivate do
    transitions :to => :inactive, :from => [:passive, :pending, :verified, :active, :deleted, :banned]
  end
  aasm_event :ban do
    transitions :banned => :active, :from => [:passive, :pending, :verified, :active, :inactive, :deleted]
  end
  aasm_event :delete do
    transitions :to => :deleted, :from => [:passive, :pending, :verified, :active, :inactive, :banned]
  end

  def do_activate
    @activated = true    
    self.deleted_at = self.perishable_token = nil
  end
  
  # Some methods used by observers
  def recently_activated?
    @activated
  end
  
  # Instqnce nethods
  def is_admin?
    self.is_admin
  end
  
  # Class methods
  
end
