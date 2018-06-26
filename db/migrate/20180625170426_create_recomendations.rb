class CreateRecomendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recomendations do |t|
      t.string :cancer_type
      t.string :recomendation

      t.timestamps
    end
  end
end
