class BookmarksController < ApplicationController
  before_action :load_blog, only: [:create, :destroy]

  def create
    current_user.bookmarks.create post_id: @blog.id
  end

  def destroy
    @bookmark = Bookmark.find_by user_id: current_user.id, post_id: @blog.id
    @bookmark.destroy
  end

  private

  def load_blog
    @blog = Post.find_by id: params[:id]
  end
end
