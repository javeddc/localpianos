require 'rails_helper'

RSpec.describe Flag, type: :model do
  it "is not valid without a user id" do
    flag = Flag.new(user_id: nil)
    expect(flag).to_not be_valid
  end

  it "is not valid without a piano id" do
    flag = Flag.new(piano_id: nil)
    expect(flag).to_not be_valid
  end
end
