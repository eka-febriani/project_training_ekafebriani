class Country < ActiveRecord::Base
  belongs_to :user
  validates :name, :presence => true, :length => {:maximum => 15, :message => "Only 15 characters"}

  validate :valid_code
  def valid_code
    self.errors[:code] << "Your country code must id, usa or frc" unless code == 'id' || code == 'usa' || code == 'frc'
  end

end
