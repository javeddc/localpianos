class PianoPhotosController < ApplicationController
  protect_from_forgery

  def edit
    authorize
    @piano_id = Piano.find(params[:id]).id
  end

  def post
    authorize
    if params[:piano_id] && params[:content]
      PianoPhoto.create(
        user_id: current_user.id,
        piano_id: params[:piano_id],
        image_url: params[:content]
      )
    end
    redirect_to piano_path(params[:piano_id].to_i)
  end
end
