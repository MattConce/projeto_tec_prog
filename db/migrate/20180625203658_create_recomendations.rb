class CreateRecomendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recomendations do |t|
      t.string :type_cancer
      t.text :info

      t.timestamps
    end
  end
end
