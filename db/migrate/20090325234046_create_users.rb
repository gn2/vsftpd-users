class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.column :name, :string
      t.column :email, :string
      t.column :login, :string
      t.column :password_salt, :string
      t.column :crypted_password, :string
      t.column :persistence_token, :string
      t.column :login_count, :integer
      t.column :last_request_at, :datetime
      t.column :last_login_at, :datetime
      t.column :current_login_at, :datetime
      t.column :last_login_ip, :string
      t.column :current_login_ip, :string
      t.column :state, :string
      t.column :company_id, :integer
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
      t.column :deleted_at, :datetime
    end
  end

  def self.down
    drop_table :users
  end
end
