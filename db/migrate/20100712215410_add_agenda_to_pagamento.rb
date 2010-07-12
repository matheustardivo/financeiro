class AddAgendaToPagamento < ActiveRecord::Migration
  def self.up
    add_column :pagamentos, :agenda_id, :integer
  end

  def self.down
    remove_column :pagamentos, :agenda_id
  end
end
