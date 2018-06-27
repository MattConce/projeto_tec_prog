class AddBoneDonationToRecomendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recomendations, :bone_donation, :boolean
  end
end
