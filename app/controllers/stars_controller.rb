class StarsController < ApplicationController

  def create
    authorize
    Star.create(user_id: params[:user_id], piano_id: params[:piano_id])
  end


  def toggle
    authorize
    star_to_toggle = Star.where(user_id: current_user.id, piano_id: params[:piano_id])[0]

    if star_to_toggle == nil
      star_to_toggle = Star.create(user_id: current_user.id, piano_id: params[:piano_id])
    else
      star_to_toggle.destroy
    end

    if star_to_toggle != nil
      result = 'created'
    else
      result = 'destroyed'
    end

  end

end
