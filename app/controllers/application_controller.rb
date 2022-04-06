class ApplicationController < ActionController::Base
  #デフォルトではnoticeとalertのみのため追加する
  add_flash_types :success, :info, :warning, :danger
end
