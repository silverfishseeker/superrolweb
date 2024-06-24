class RemoceIndexFromSpells < ActiveRecord::Migration[7.0]
  def change
    remove_column :spells, :index, :string
  end
end
