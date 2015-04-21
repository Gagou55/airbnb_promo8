class ChangeFormatInFlats < ActiveRecord::Migration
  def change
    change_column :flats, :zip_code, :string
  end
end
