class CreateCartaos < ActiveRecord::Migration
  def self.up
    create_table :cartaos do |t|
      t.string :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :cartaos
  end
end
