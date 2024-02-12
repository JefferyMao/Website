class CommentsController < ApplicationController
    before_action :authenticate_user!

  def create
    travel = Travel.find(params[:travel_id])
    comment = travel.comments.build(comment_params) #buildを使い、contentとtweet_idの二つを同時に代入
    comment.user_id = current_user.id
    if comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      redirect_to travel_path(comment.travel)  # Commentに紐づくTravelのshowページにリダイレクト
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @travel = Travel.find(params[:travel_id])
      @comment = @travel.comments.find(params[:id])
      @comment.destroy
  
      redirect_to travel_path(@travel)
  end

  private

    def comment_params
      params.require(:comment).permit(:content).merge(travel_id: params[:travel_id])
    end
end
