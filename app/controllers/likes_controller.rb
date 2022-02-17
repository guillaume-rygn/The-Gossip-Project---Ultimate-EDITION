class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create

    @like = Like.new(
      'user_id' => current_user.id,
      'gossip_id' => params[:gossip_id]
    )
    
    if @like.save
      puts"save"
      redirect_to root_path
    else
      render 'new'
    end
  end

def destroy
    @like = Like.find_by(gossip_id: params[:gossip_id])
    if @like.destroy
        redirect_to root_path
    else
 
      puts "echec"
    end

end
end