class AddLocalToRegisters < ActiveRecord::Migration[5.2]
  def change
    add_column :registers, :local, :string
  end
end
