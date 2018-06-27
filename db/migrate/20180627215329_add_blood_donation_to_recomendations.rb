class AddBloodDonationToRecomendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recomendations, :blood_donation, :boolean
  end
end
