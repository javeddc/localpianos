class User < ApplicationRecord
  has_secure_password
  before_create :randomize_id

  private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(1_000_000)
    end while User.where(id: self.id).exists?
  end
end
