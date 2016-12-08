class CommentsController < ApplicationController

def show
	@comment = Comment.new
    @comments = Comment.where(user_id:params[:id])
end

def new
	@location = Location.find(params[:id])
	@comment = @location.comments.build 
end

def create
	@location = Location.find(params[:id])
	@comment = Comment.create(comment_params)
 
    if @comment.save
      redirect_to '/locations/' + @comment.location_id.to_s 
    else
      flash.now[:danger] = "Your comment has no content"
    end 
end

private 

def comment_params
    params.require(:comment).permit(:location_id, :user_id, :user_comment, :user_rating)
end


end
