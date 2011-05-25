class AddVencimentoToCartaos < ActiveRecord::Migration
  def self.up
    add_column :cartaos, :vencimento, :integer
  end

  def self.down
    remove_column :cartaos, :vencimento
  end
end
