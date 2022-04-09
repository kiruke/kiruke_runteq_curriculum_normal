class ApplicationController < ActionController::Base
  #デフォルトではnoticeとalertのみのため追加する
  add_flash_types :success, :info, :warning, :danger
  #ログインしていなければ、掲示板機能を利用できなくする
  before_action :login_required

  private
    def login_required
      redirect_to login_url unless current_user
    end
end
