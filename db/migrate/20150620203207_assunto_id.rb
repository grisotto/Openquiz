class AssuntoId < ActiveRecord::Migration
  def change
  	add_column :questaos, :assunto_id, :integer, default: 0
  end
end
