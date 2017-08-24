require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is not valid without a user id" do
    comment = Comment.new(user_id: nil)
    expect(comment).to_not be_valid
  end

  it "is not valid without a piano id" do
    comment = Comment.new(piano_id: nil)
    expect(comment).to_not be_valid
  end

  it "is not valid without text in the body" do
    comment = Comment.new(body: nil)
    expect(comment).to_not be_valid
  end

end
