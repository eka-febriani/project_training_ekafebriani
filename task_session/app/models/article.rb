class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :users
  validates :title, :presence => true, :uniqueness =>true

  scope :rating_is_and_above, lambda{|rating| where("rating >= ?", rating)}
  
end
