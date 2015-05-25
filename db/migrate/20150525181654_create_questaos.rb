class CreateQuestaos < ActiveRecord::Migration
  def change
    create_table :questaos do |t|
      t.text :pergunta
      t.text :resposta
      t.text :dica
      t.references :tema, index: true
	t.references :user, index: true
      t.timestamps null: false
    end
   add_foreign_key :questaos, :temas
   add_foreign_key :questaos, :users
  end
end
