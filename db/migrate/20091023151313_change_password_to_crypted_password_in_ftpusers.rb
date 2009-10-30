class ChangePasswordToCryptedPasswordInFtpusers < ActiveRecord::Migration
  def self.up
    rename_column :ftpusers, :password, :crypted_password
  end

  def self.down
    rename_column :ftpusers, :crypted_password, :password
  end
end
