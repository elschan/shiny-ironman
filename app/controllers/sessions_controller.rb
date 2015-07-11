class SessionsController < ApplicationController
  
  def new
  end

  def create
    member = Member.find_by(email: params[:email])
    if member && member.authenticate(params[:password])
      session[:member_id] = member.id
      redirect_to posts_path, notice: "Hi #{}"
    else
      flash.now[:alert] = "Login failed. Try again."
      render :new
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to posts_path
  end


end
