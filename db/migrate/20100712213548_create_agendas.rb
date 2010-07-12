class CreateAgendas < ActiveRecord::Migration
  def self.up
    create_table :agendas do |t|
      t.belongs_to :user
      t.string :nome
      t.date :mes

      t.timestamps
    end
  end

  def self.down
    drop_table :agendas
  end
end
