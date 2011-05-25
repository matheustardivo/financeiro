class AddConfirmadoToFaturas < ActiveRecord::Migration
  def self.up
    add_column :faturas, :confirmado, :boolean
  end

  def self.down
    remove_column :faturas, :confirmado
  end
end
