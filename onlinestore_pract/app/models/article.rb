class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  belongs_to :product

end
