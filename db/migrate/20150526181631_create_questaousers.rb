class CreateQuestaousers < ActiveRecord::Migration
  def change
    create_table :questaousers do |t|
      
      t.integer :entendimento
 	t.references :questao,  index: true
	t.references :user, index: true
      t.timestamps null: false
    end
    add_foreign_key :questaousers, :users
	add_foreign_key :questaousers, :questaos
  end
end
