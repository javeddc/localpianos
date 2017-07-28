class StarsController < ApplicationController

  def create
    Star.create(user_id: params[:user_id], piano_id: params[:piano_id])
  end

end
