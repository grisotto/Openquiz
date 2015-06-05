class Gerarslug3 < ActiveRecord::Migration
  def change
  end

  add_index :assuntos, :slug, unique: true
  add_index :temas, :slug, unique: true
end
