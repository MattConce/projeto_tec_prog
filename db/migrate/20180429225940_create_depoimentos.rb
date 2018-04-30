class CreateDepoimentos < ActiveRecord::Migration[5.1]
  def change
    create_table :depoimentos do |t|
      t.text :texto
      t.integer :usuario_id

      t.timestamps
    end
  end
end
