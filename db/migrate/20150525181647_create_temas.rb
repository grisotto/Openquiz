class CreateTemas < ActiveRecord::Migration
  def change
    create_table :temas do |t|
      t.string :nome_tema
      t.references :assunto, index: true
	t.references :user, index: true
      t.timestamps null: false
    end
add_foreign_key :temas, :users
add_foreign_key :temas, :assuntos
  end
end
