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
  
  
end
