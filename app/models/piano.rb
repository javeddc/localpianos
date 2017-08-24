class Piano < ApplicationRecord

  validates :user_id, presence: true
  validates :address, presence: true, unless: ->(piano){piano.latitude.present?}
  validates :latitude, presence: true, unless: ->(piano){piano.address.present?}
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :if => :address_changed?
  after_validation :reverse_geocode, :if => :longitude_changed?
  before_create :randomize_id

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end
end
