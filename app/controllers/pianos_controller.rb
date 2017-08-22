class PianosController < ApplicationController
  


  def index
    # CHANGE LINE BELOW FOR DEPLOYMENT!!
    user_location = Geocoder.search(request.remote_ip)[0]
    # user_location = Geocoder.search("125.253.50.72")[0]
    @coordinates = { latitude: user_location.latitude, longitude: user_location.longitude }
    if user_location.country_code == "RD" || user_location.country_code == ""
      @coordinates = { latitude: -37.8196, longitude: 144.9631 }
    end
    @city = request.location.city
    @pianos = Piano.all
  end

  def show
    @piano = Piano.find(params[:id])
    @comments = Comment.where(piano_id: params[:id])
    @nearbys = @piano.nearbys(4)
  end

  def map_me
  end

  def search_test
  end

  def new
    authorize
  end

  def create
    authorize
    piano = Piano.new
    piano.address = params[:address]
    piano.access_description = params[:accessDescription]
    piano.location_description = params[:locationDescription]
    piano.piano_description = params[:pianoDescription]
    piano.category = params[:category]
    if piano.address == nil
      redirect_to '/pianos/new'
    end
    piano.save
    redirect_to '/pianos'
  end

end
