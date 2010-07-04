class CreatePagamentos < ActiveRecord::Migration
  def self.up
    create_table :pagamentos do |t|
      t.text :nome
      t.text :descricao
      t.date :vencimento
      t.decimal :valor
      t.boolean :confirmado

      t.timestamps
    end
  end

  def self.down
    drop_table :pagamentos
  end
end
