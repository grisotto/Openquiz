class Addtemaid < ActiveRecord::Migration
  def change
    add_column :questaousers, :tema_id, :integer
  end
end
