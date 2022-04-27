class BoardsController < ApplicationController

  def index
    #includesでN+1問題を解決
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
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
    @comment = Comment.new
    @comments = @board.comments.includes(:user).order(created_at: :desc)
  end


  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
end