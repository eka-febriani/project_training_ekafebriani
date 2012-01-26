class User < ActiveRecord::Base

  attr_accessible :email, :password, :password_confirmation, :age, :address, :first_name, :last_name, :username

  has_many :products, :dependent => :destroy
  has_many :articles, :dependent => :destroy
  has_one :country
  has_many :shared_articles, :class_name => "Article", :foreign_key => "Article_id", :conditions => "title LIKE '%share%'"

  validates :first_name, :presence => true, :length => { :maximum => 20}, :format => { :with => /\A[a-zA-Z]+\z/}

  validates :last_name, :presence => true, :length => { :maximum => 20}, :format => { :with => /\A[a-zA-Z]+\z/}

  validates :email, :presence => true, :uniqueness =>true
  validates :username, :presence => true, :uniqueness =>true

  attr_accessor :password
  before_save :encrypt_password
  validates :password, :presence => {:on => :create}, :confirmation => true
  validates :email, :presence => true, :uniqueness => true

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def is_admin?
    self.email == "admin@admin.com"
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
