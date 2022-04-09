class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end



  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
