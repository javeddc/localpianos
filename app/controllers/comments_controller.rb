class CommentsController < ApplicationController

  def grab
    comments_for_piano = Comment.where(piano_id: params[:pianoId]).order("created_at ASC")
    render json: comments_for_piano.map { |comment| {
        :id => comment.id,
        :user => comment.user_id,
        :username => User.find(comment.user_id).username,
        :timestamp => comment.created_at,
        :datestring => comment.created_at.strftime("%B, %Y"),
        :body => comment.body,
        :image => User.find(comment.user_id).image_url
      }
    }
  end

  def create
    authorize
    if params[:piano_id] && params[:body]
      Comment.create(
      user_id: current_user.id,
      piano_id: params[:piano_id],
      body: params[:body])
    end
    redirect_to piano_path(params[:piano_id])
  end

end
