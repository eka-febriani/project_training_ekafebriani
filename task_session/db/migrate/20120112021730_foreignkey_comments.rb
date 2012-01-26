class ForeignkeyArticleComments < ActiveRecord::Migration
  def up
    add_column :comments, :article_id, :integer
  end

  def down
    remove_column :comments, :article_id
  end
end
