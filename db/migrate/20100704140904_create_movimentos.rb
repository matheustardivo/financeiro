class CreateMovimentos < ActiveRecord::Migration
  def self.up
    create_table :movimentos do |t|
      t.integer :conta_id
      t.integer :tipo_id
      t.date :dia
      t.text :descricao
      t.decimal :valor

      t.timestamps
    end
  end

  def self.down
    drop_table :movimentos
  end
end
