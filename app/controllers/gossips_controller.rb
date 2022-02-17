class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end
  
  def create
    puts "$"*120
    @gossip = Gossip.new(
      'title' => params[:title],
      'content' => params[:content],
      'user_id' => current_user.id)

    if @gossip.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.all
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])

    params.require(:gossip).permit(:title,:content).inspect
  
    if @gossip.update(gossip_params)
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end

  private 

  def gossip_params
    gossip_params = params.require(:gossip).permit(:title,:content)

  end

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

end