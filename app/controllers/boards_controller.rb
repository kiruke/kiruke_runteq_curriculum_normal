class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
