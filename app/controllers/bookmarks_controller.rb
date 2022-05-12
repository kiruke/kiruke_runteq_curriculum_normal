class BookmarksController < ApplicationController

  def create
    #board_idとuser_idの組み合わせをbookmarkテーブルに保存する
    bookmark = current_user.bookmarks.build(board_id: params[:board_id])
    bookmark.save
    redirect_to boards_path, success: t('.success')
    #redirect_back fallback_location: root_path, success: t('.success')
  end

  def destroy
    bookmark = current_user.bookmarks.find(params[:id])
    bookmark.destroy!
    redirect_to request.referer, success: t('.success')
    #redirect_back fallback_location: root_path, success: t('.success')
  end
  
end
