class FixPhoneNumTypeInAuthors < ActiveRecord::Migration[8.0]
  def change
    change_column :authors, :phone_num, :string
  end
end
