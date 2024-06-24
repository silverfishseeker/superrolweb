class RemoveClasesFromSpell < ActiveRecord::Migration[7.0]
  def change
    remove_column :spells, :clases, :string
  end
end
