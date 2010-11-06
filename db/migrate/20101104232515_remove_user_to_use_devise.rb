class RemoveUserToUseDevise < ActiveRecord::Migration
  def self.up
    drop_table :users
  end

  def self.down
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.timestamps
    end
  end
end
