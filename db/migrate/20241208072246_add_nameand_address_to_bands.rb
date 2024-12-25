class AddNameandAddressToBands < ActiveRecord::Migration[8.0]
  def change
    add_column :bands, :name, :string
    add_column :bands, :address, :string
  end
end
