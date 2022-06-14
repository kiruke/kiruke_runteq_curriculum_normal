class Admin::BoardsController < Admin::BaseController
  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def board_params
    params.require(:board).permit(:title, :body, :board_image, :board_image_cache)
  end
  
  def set_board
    @board = current_user.boards.find(params[:id])
  end
end
