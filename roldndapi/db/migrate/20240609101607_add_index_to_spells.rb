class AddIndexToSpells < ActiveRecord::Migration[7.0]
  def change
    add_column :spells, :index, :string
  end
end
