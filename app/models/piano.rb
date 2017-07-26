class Piano < ApplicationRecord
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode, :if => :address_changed? || :latitude_changed?

end
