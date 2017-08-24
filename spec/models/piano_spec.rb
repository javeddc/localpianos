require 'rails_helper'

RSpec.describe Piano, type: :model do
  context "where an address is given" do
    it "is valid" do
      piano = Piano.new
      piano.user_id = 100
      piano.address = "2 Grandview Parade, Epping NSW 2121, Australia"
      expect(piano.valid?).to eq true
    end
    it "gets coordinates after validation" do
      piano = Piano.new
      piano.address = "2 Grandview Parade, Epping, Sydney"
      piano.save
      expect([piano.latitude, piano.longitude]).to eq [-33.7748006, 151.0735855]
    end
  end

  context "where coordinates are given" do
    it "is valid" do
      piano = Piano.new
      piano.user_id = 100
      piano.latitude = -33.7748006
      piano.longitude = 151.0735855
      expect(piano.valid?).to eq true
    end
    
    it "gets address after validation" do
      piano = Piano.new
      piano.latitude = -33.7748006
      piano.longitude = 151.0735855
      piano.save
      expect(piano.address).to eq "2 Grandview Parade, Epping NSW 2121, Australia"
    end
  end

  it "is not valid without any location information" do
    piano = Piano.new
    piano.user_id = 100
    expect(piano.valid?).to eq false
  end





end
