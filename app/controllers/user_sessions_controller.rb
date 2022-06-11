class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      #もともと書いてたredirect_to動きが理解出来ていなかった
      #redirect_to root_url
      flash[:success] = t('.success')
      redirect_back_or_to boards_url
    else
      flash.now[:danger] = t('.fail')
      render action: 'new'
    end
  end

  def destroy
    logout
    flash[:success] = t('.success')
    redirect_to root_url
  end
end
