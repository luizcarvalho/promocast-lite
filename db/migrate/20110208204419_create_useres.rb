class CreateUseres < ActiveRecord::Migration
  def self.up
    create_table "useres", :force => true do |t|
      t.string   :login,                     :limit => 40
      t.string   :name,                      :limit => 100, :default => '', :null => true
      t.string   :email,                     :limit => 100
      t.string   :crypted_password,          :limit => 40
      t.string   :salt,                      :limit => 40
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :remember_token,            :limit => 40
      t.datetime :remember_token_expires_at


    end
    add_index :useres, :login, :unique => true

    User.create!(:login=>"admin",:password=>"passadmin",:password_confirmation=>"passadmin",:email=>"admin@host.com")
  end

  def self.down
    drop_table "useres"
  end
end
