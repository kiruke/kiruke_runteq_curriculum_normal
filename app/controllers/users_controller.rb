class UsersController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #flash[:success] = 'ユーザー登録しました。'
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name)
  end
end
