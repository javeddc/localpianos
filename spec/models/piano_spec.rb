require 'rails_helper'

RSpec.describe Piano, type: :model do
  it "gets coordinates after validation if it has an address" do
    piano = Piano.new
    piano.address = "2 Grandview Parade, Epping, Sydney"
    piano.save
    expect([piano.latitude, piano.longitude]).to eq [-33.7748006, 151.0735855]
  end
  it "gets address after validation if it has coordinates" do
    piano = Piano.new
    piano.latitude = -33.7748006
    piano.longitude = 151.0735855
    piano.save
    expect(piano.address).to eq "2 Grandview Parade, Epping NSW 2121, Australia"
  end

  it "is not valid without any location information" do
    piano = Piano.new
    piano.user_id = 100
    expect(piano.valid?).to eq false
  end

  it "is valid when it has an address but no coordinates" do
    piano = Piano.new
    piano.user_id = 100
    piano.address = "2 Grandview Parade, Epping NSW 2121, Australia"
    expect(piano.valid?).to eq true
  end

  it "is valid when it has a coordinates but no address" do
    piano = Piano.new
    piano.user_id = 100
    piano.latitude = -33.7748006
    piano.longitude = 151.0735855
    expect(piano.valid?).to eq true
  end

end
