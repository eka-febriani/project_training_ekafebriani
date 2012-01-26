class AddColumnUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
  end

  def up
    add_column :users, :address, :string
    add_column :users, :age, :integer
    add_column :users, :birthday, :datetime
  end

  def down
    remove_column :users, :address
    remove_column :users, :age
    remove_column :users, :birthday
  end
end
