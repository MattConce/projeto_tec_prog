class AddBloodDonationToRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :registers, :blood_donation, :boolean
  end
end
