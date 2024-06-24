class CreateClases < ActiveRecord::Migration[7.0]
  def change
    create_table :clases do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
