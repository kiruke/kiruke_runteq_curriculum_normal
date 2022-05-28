class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update]

  def show

  end

  def edit

  end

  def update
    if @profile.update(user_params)
      redirect_to profiles_path
    else 
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user
  end

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :avatar)
  end
end
