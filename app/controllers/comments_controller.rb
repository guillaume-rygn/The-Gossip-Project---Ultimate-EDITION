class CommentsController < ApplicationController

  before_action :authenticate_user, only: [:new, :create]

  def new
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(
      content: params[:content], 
      user_id: current_user.id,
      gossip_id: params[:gossip_id]
    )
 
    if @comment.save
        redirect_to gossip_path(@gossip.id)
    else
      render @gossip
    end

  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])

    @comment = Comment.find(params[:id])
    comment_params = params.require(:comment).permit(:content)
    @comment.update(comment_params)
    redirect_to @gossip
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])

    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @gossip, :notice => "Le commentaire a bien été supprimé"
  end

  private 

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
