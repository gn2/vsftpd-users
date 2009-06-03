class UpdatingFtpusersAssociation < ActiveRecord::Migration
  def self.up
    remove_column :ftpusers, :user_id
    add_column :ftpusers, :group_id, :integer
  end

  def self.down
    remove_column :ftpusers, :group_id
    add_column :ftpusers, :user_id, :integer
  end
end
