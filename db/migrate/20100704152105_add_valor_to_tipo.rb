class AddValorToTipo < ActiveRecord::Migration
  def self.up
    add_column :tipos, :valor, :string
  end

  def self.down
    remove_column :tipos, :valor
  end
end
