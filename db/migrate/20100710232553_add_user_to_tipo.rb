class AddUserToTipo < ActiveRecord::Migration
  def self.up
    add_column :tipos, :user_id, :integer
  end

  def self.down
    remove_column :tipos, :user_id
  end
end
