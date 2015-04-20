class CreateFlats < ActiveRecord::Migration
  def change
    create_table :flats do |t|
      t.string :type_of_property
      t.string :type_of_habitation
      t.integer :capacity
      t.string :street
      t.integer :zip_code
      t.string :city
      t.text :description
      t.string :picture1
      t.string :picture2
      t.string :picture3
      t.integer :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
