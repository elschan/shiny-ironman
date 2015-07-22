class SignupsController < ApplicationController
  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to root_path
      flash[:notice] = "We've received your signup and will be looking into it shortly!"
    else
      flash[:notice] = "Something went wrong. You probably wnat to try again."
      render :new
    end
  end

  def accepted
    @signup = Signup.find(params[:id])
    @signup.accepted = true
    @signup.save
    redirect_to members_path
  end

protected

  def signup_params
    params.require(:signup).permit(:email, :application)
  end

end
