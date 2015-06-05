class Gerarslug2 < ActiveRecord::Migration
    def change
      add_column :assuntos, :slug, :string
      add_column :temas, :slug, :string
    end



  end

