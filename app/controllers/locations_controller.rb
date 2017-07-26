class LocationsController < ApplicationController


  def user_location
    # CHANGE LINE BELOW FOR DEPLOYMENT!!
    # result = Geocoder.search(request.remote_ip)
    user_location = Geocoder.search("125.253.50.72")[0]
    render json: {latitude: user_location.latitude, longitude: user_location.longitude}
  end

  def current
    render json: {nearbys: [
      {address: Piano.all[0].address, latitude: Piano.all[0].latitude, longitude: Piano.all[0].longitude, category: Piano.all[0].category},
      {address: Piano.all[1].address, latitude: Piano.all[1].latitude, longitude: Piano.all[1].longitude, category: Piano.all[1].category},
      {address: Piano.all[2].address, latitude: Piano.all[2].latitude, longitude: Piano.all[2].longitude, category: Piano.all[2].category}
      ]
    }
  end

  def pianos_near
    render json: Piano.near({latitude: -37.8196, longitude: 144.9631})
  end


end
