class Adddisponivel < ActiveRecord::Migration
  def change
    add_column :assuntos, :disponivel, :integer, default: 0
    add_column :temas, :disponivel, :integer, default: 0
    add_column :questaos, :disponivel, :integer, default: 0
  end
end
