class ForeignkeyArticles < ActiveRecord::Migration
  def up
    add_column :articles, :product_id, :integer
  end

  def down
    remove
  end_column :articles, :product_id
end
