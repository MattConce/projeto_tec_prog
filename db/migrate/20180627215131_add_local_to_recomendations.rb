class AddLocalToRecomendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recomendations, :local, :string
  end
end
