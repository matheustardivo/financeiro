class CreateDespesas < ActiveRecord::Migration
  def self.up
    create_table :despesas do |t|
      t.integer :fatura_id
      t.date :data
      t.integer :tipo_id
      t.integer :parcelas
      t.text :descricao
      t.decimal :valor
      t.integer :despesa_id

      t.timestamps
    end
  end

  def self.down
    drop_table :despesas
  end
end
