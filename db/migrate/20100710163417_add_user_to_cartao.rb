class AddUserToCartao < ActiveRecord::Migration
  def self.up
    add_column :cartaos, :user_id, :integer
  end

  def self.down
    remove_column :cartaos, :user_id
  end
end
