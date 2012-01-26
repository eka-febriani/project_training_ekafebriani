class Product < ActiveRecord::Base
  has_many :articles, :dependent => :destroy

  belongs_to :users
  belongs_to :categories
end
