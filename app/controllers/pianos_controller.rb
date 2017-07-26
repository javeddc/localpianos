class PianosController < ApplicationController

  def index
    # CHANGE LINE BELOW FOR DEPLOYMENT!!
    user_location = Geocoder.search(request.remote_ip)[0]
    # user_location = Geocoder.search("125.253.50.72")[0]

    @coordinates = { latitude: user_location.latitude, longitude: user_location.longitude }

    if user_location.country_code == 'RD' || ''
      @coordinates = { latitude: -37.8196, longitude: 144.9631 }
    end

    @city = request.location.city
    @pianos = Piano.all
  end

  def show
    @piano = Piano.find(params[:id])
    @nearbys = @piano.nearbys(8)
  end

  def map_me
  end

  def search_test
  end

end
