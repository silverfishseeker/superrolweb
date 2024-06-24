class CreateMagicschools < ActiveRecord::Migration[7.0]
  def change
    create_table :magicschools do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
