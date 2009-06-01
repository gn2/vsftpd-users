class CreateFtpusers < ActiveRecord::Migration
  def self.up
    create_table :ftpusers, :force => true do |t|
      t.column :login, :string
      t.column :password, :string
      t.column :state, :string
      t.column :user_id, :integer
      t.column :server_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :ftpusers
  end
end
