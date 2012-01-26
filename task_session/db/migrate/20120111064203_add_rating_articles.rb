class AddRatingArticles < ActiveRecord::Migration
  def up
    add_column :articles, :rating, :string
  end

  def down
    remove_column :articles, :rating
  end
end
