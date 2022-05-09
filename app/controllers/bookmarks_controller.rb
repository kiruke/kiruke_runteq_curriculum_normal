class BookmarksController < ApplicationController

  def create
    #board_idとuser_idの組み合わせをbookmarkテーブルに保存する
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    bookmark.save
    redirect_to boards_path
  end

  def destroy
    byebug
    bookmark = current_user.bookmarks.find(params[:id])
    bookmark.destroy!
  end

end
