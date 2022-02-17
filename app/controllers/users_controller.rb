class UsersController < ApplicationController

  def show 
    @user = User.find(params[:id])
    @gossip = @user.gossips
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      'first_name' => params[:first_name],
      'last_name' => params[:last_name],
      'email' => params[:email],
      'city_id' => rand(1..10),
      'password' => params[:password],
    )
    if @user.save
      redirect_to new_session_path
    else
      render 'new'
    end


    
  end

end