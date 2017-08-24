require 'rails_helper'

RSpec.describe PianoPhoto, type: :model do
  it "is not valid without a user id" do
    piano_photo = PianoPhoto.new(user_id: nil)
    expect(piano_photo).to_not be_valid
  end

  it "is not valid without a piano id" do
    piano_photo = PianoPhoto.new(piano_id: nil)
    expect(piano_photo).to_not be_valid
  end

  it "is not valid without an image url" do
    piano_photo = PianoPhoto.new(image_url: nil)
    expect(piano_photo).to_not be_valid
  end

end
