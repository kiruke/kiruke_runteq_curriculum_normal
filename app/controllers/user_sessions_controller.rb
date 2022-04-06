class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      #もともと書いてたredirect_to動きが理解出来ていなかった
      #redirect_to root_url
      redirect_back_or_to root_url
    else
      render action: 'new'
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
