class ChangetypeIdCategoriesProducts < ActiveRecord::Migration
  def up
    change_column :categories_products, :category_id, :integer
    change_column :categories_products, :product_id, :integer
  end

  def down
    change_column :categories_products, :category_id, :string
    change_column :categories_products, :product_id, :string
  end
end
