class BoardsController < ApplicationController
  def index
    @boards = Board.all.includes(:user).order(created_at: :desc)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = t('.success')
      redirect_back_or_to boards_url
    else
      flash.now[:danger] = t('.fail')
      render action: 'new'
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :body)
  end
end