class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :child_category, :class_name => "Category"
  belongs_to :parent_category, :class_name => "Category"

  scope :parent_category, where("parent_id = parent_category.id")
  scope :child_category, where("parent_id = child_category.id")
end
