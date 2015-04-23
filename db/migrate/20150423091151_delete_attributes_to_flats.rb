class DeleteAttributesToFlats < ActiveRecord::Migration
  def change
    remove_column :flats, :street, :string
    remove_column :flats, :zip_code, :integer
    remove_column :flats, :city, :string
  end
end
