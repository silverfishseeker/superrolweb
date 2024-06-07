class CreateSpells < ActiveRecord::Migration[7.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :url
      t.integer :level
      t.string :desc
      t.string :clases

      t.timestamps
    end
  end
end
