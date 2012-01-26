class ForeignkeyUserCountry < ActiveRecord::Migration
  def up
    add_column :countries, :user_id, :integer
  end

  def down
    remove_column :countries, :user_id
  end
end
