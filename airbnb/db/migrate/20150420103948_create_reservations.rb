class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :begin_date
      t.date :end_date
      t.boolean :validation
      t.references :flat, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
