class AddUserToConta < ActiveRecord::Migration
  def self.up
    add_column :contas, :user_id, :integer
  end

  def self.down
    remove_column :contas, :user_id
  end
end
