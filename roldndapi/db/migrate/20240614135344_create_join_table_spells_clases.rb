class CreateJoinTableSpellsClases < ActiveRecord::Migration[7.0]
  def change
    create_join_table :spells, :clases
  end
end
