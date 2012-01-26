class Product < ActiveRecord::Base
  has_many :categories, :through => :categoriesproducts
  has_many :categoriesproducts
  belongs_to :users

  scope:price_more_than_1000, where("price >'1000'")
end
