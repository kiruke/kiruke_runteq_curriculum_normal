class BoardsController < ApplicationController
  before_action :set_board, only: [:edit, :update, :destroy]

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
      redirect_to boards_url
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

  def edit
    #before_action
    #@board = current_user.boards.find(params[:id])
  end

  def update
    #before_action
    #@board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to @board, success: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Board.model_name.human)
      render :edit
    end
  end

  def destroy
    #before_action
    #@board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to boards_url, success: t('defaults.message.deleted', item: Board.model_name.human)
  end

  def bookmarks
    @bookmarks = current_user.bookmark_boards
    #@bookmarks = Bookmark.where(user_id: current_user.id)
  end


  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
  
  def set_board
    @board = current_user.boards.find(params[:id])
  end
end