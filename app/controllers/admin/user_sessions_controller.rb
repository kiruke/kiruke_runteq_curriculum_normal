class Admin::UserSessionsController < Admin::BaseController
  skip_before_action :require_login, only: %i[new create]
  skip_before_action :admin_check, only: %i[new create]

  layout 'admin/layouts/login'

  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = t('.success')
      redirect_to admin_root_path
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = t('.success')
    redirect_to admin_login_path
  end
end
