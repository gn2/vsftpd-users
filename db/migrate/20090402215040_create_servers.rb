class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers, :force => true do |t|
      t.column :name, :string
      t.column :ip_address, :string
      t.column :description, :text
      t.column :crated_at, :datetime
      t.column :updated_at, :datetime
    end
  end

  def self.down
    drop_table :servers
  end
end
