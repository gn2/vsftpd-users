class User < ActiveRecord::Base
  include AASM
  acts_as_authentic
  is_paranoid

  attr_accessible :name, :login, :email, :password, :password_confirmation
  
  # Validations
  validates_presence_of :name
  validates_uniqueness_of :login, :email
  #validates_numericality_of :is_admin, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1
  #validates_inclusion_of :is_admin, :in => %w(0 1)
  #validates_format_of :is_admin, :with => /\A["0"]\z/
  
  # Relationships
  has_and_belongs_to_many :groups
  
  # AASM configuration
  aasm_column :state
  aasm_initial_state :pending
  
  aasm_state :pending
  aasm_state :active, :enter => :do_activate
  aasm_state :inactive
  aasm_state :banned
  aasm_state :deleted
  
  aasm_event :activate do
    transitions :to => :active, :from => [:pending, :inactive, :banned]
  end
  aasm_event :inactivate do
    transitions :to => :inactive, :from => [:pending, :active, :banned]
  end
  aasm_event :ban do
    transitions :to => :banned, :from => [:pending, :active, :inactive]
  end
  aasm_event :delete do
    transitions :to => :deleted, :from => [:pending, :active, :inactive, :banned]
  end

  def do_activate
    @activated = true    
    # self.deleted_at = nil
  end
  
  # Some methods used by observers
  def recently_activated?
    @activated
  end
  
  # Instance nethods
  def is_admin?
    self.is_admin
  end
  
  def ftpusers
    returning [] do |ftpusers|
      self.groups.each do |group|
        ftpusers << group.ftpusers
      end
    end.flatten
  end
  
  def servers
    returning [] do |servers|
      self.groups.each do |group|
        group.ftpusers.each do |ftpuser|
          servers << ftpuser.server
        end
      end
    end.flatten.uniq
  end
  
  # Class methods
  def self.admins
    self.find(:all, :conditions => {:is_admin => 1})
  end
end
