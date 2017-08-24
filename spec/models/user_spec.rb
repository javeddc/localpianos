require 'rails_helper'

RSpec.describe User, type: :model do
  it "is not valid without an email address" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a password digest" do
    user = User.new(password_digest: nil)
    expect(user).to_not be_valid
  end

  it "is not valid without a username" do
    user = User.new(username: nil)
    expect(user).to_not be_valid
  end

end
