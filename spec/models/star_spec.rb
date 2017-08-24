require 'rails_helper'

RSpec.describe Star, type: :model do
  it "is not valid without a user id" do
    star = Star.new(user_id: nil)
    expect(star).to_not be_valid
  end

  it "is not valid without a piano id" do
    star = Star.new(piano_id: nil)
    expect(star).to_not be_valid
  end
end
