class Location < ApplicationRecord

  geocoded_by :address, :ip_address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode, :if => :address_changed? || :latitude_changed? || :ip_address_changed?

  attr_accessor :latitude, :longitude, :address, :ip_address

end
