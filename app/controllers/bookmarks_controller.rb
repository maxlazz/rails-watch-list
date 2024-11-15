class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save

    redirect_to lists_path(@bookmark)
    # new_list_bookmark
    # list_bookmarks
  end

  def destroy
    @bookmark.destroy

    redirect_to bookmarks_path, status: :see_other
  end

  private

  def bookmark_params
      params.require(:bookmark).permit(:title, :overview, :poster_url, :rating)
  end

  def set_bookmark
      @bookmark = Bookmark.find(params[:id])
  end
end
