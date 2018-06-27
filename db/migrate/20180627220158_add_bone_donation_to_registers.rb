class AddBoneDonationToRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :registers, :bone_donation, :boolean
  end
end
