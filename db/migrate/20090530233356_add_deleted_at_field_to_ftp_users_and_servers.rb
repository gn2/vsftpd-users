class AddDeletedAtFieldToFtpUsersAndServers < ActiveRecord::Migration
  def self.up
    add_column :ftpusers, :deleted_at, :datetime
    add_column :servers, :deleted_at, :datetime
  end

  def self.down
    remove_column :ftpusers, :deleted_at
    remove_column :servers, :deleted_at
  end
end
