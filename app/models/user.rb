class User < ActiveRecord::Base
  include AASM
  acts_as_authentic
  is_paranoid
  
  aasm_column :state
  aasm_initial_state :pending
  
  aasm_state :pending
  aasm_state :active
  aasm_state :inactive
  aasm_state :banned
  aasm_state :deleted
  
  has_many :ftp_users
  
  def is_admin?
    self.is_admin
  end
end
