class CreateJoinTableSpellsMagicschools < ActiveRecord::Migration[7.0]
  def change
    create_join_table :spells, :magicschools
  end
end
