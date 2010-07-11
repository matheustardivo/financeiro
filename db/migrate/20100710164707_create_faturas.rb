class CreateFaturas < ActiveRecord::Migration
  def self.up
    create_table :faturas do |t|
      t.integer :cartao_id
      t.date :mes
      t.string :situacao

      t.timestamps
    end
  end

  def self.down
    drop_table :faturas
  end
end
