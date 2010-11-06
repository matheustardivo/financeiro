class AddUserToPagamento < ActiveRecord::Migration
  def self.up
    add_column :pagamentos, :user_id, :integer
  end

  def self.down
    remove_column :pagamentos, :user_id
  end
end
