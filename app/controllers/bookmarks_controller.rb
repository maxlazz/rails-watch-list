class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(comment: bookmark_params[:comment])
    @list = List.find(params[:list_id])
    @bookmark.list_id = @list.id
    @bookmark.movie_id = bookmark_params[:movie]
    @bookmark.save

    redirect_to list_path(@bookmark.list_id)
    # new_list_bookmark
    # list_bookmarks
  end

  def destroy
    @bookmark.destroy

    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
      params.require(:bookmark).permit(:movie, :comment)
  end

  def set_bookmark
      @bookmark = Bookmark.find(params[:id])
  end
end
