class BookmarksController < ApplicationController

  def create
    #board_idとuser_idの組み合わせをbookmarkテーブルに保存する
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    @board = Board.find(bookmark.board_id)
    bookmark.save
    #redirect_to boards_path, success: t('.success')
  end

  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    @board = Board.find(bookmark.board_id)
    bookmark.destroy!
    #-------解答例-----------
    #@board = Board.find(params[:board_id])
    #current_user.bookmark(board)
    #-----------------------
    #redirect_to request.referer, success: t('.success')
  end
  
end
