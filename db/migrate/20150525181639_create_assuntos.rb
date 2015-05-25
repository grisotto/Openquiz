class CreateAssuntos < ActiveRecord::Migration
  def change
    create_table :assuntos do |t|
      t.string :nome_assunto
      t.text :descricao
      t.string :link_image
	t.references :user, index: true
      t.timestamps null: false
    end
	add_foreign_key :assuntos, :users
  end
end
