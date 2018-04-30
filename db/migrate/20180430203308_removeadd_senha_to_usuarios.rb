class RemoveaddSenhaToUsuarios < ActiveRecord::Migration[5.1]
  def change
    remove_column :usuarios, :senha, :string    
  end
end
