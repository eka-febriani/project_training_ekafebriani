class ForeignkeyUserProducts < ActiveRecord::Migration
  def up
    add_column :products, :user_id, :integer
  end

  def down
    remove_column :products, :user_id
  end
end
