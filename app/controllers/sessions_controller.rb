class SessionsController < ApplicationController

  def new

  end

  def create
  	
  	# binding.pry

  	@user = User.find_by(name: params[:user][:name])

    if @user.authenticate(params[:user][:password])
      
      # PLEASE DONT BREK EVERYHING
      session[:admin] = @user.admin

    	session[:user_id] = @user.id
    	redirect_to @user
    else
    	redirect_to @user
    end
  end

  def destroy
  	session.clear
  	redirect_to root_path
  end

end
