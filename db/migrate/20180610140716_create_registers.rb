class CreateRegisters < ActiveRecord::Migration[5.1]
  def change
    create_table :registers do |t|
      t.references :user, foreign_key: true
      t.string :blood_type
      t.string :cancer_type

      t.timestamps
    end
  end
end
