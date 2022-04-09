class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      #もともと書いてたredirect_to動きが理解出来ていなかった
      #redirect_to root_url
      flash[:success] = 'ログインに成功しました。'
      redirect_back_or_to boards_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render action: 'new'
    end
  end

  def destroy
    reset_session
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
end
