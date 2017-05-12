class Admin::PostsController < Admin::AdminController
  before_action :authenticate_user!, except: :index
  before_action :load_blog, only: :destroy
  load_and_authorize_resource

 
  def index
    @blogs = Post.all.page(params[:page]).per(3)
  end

  def destroy
    if @blogs.destroy
      redirect_to admin_blogs_path
    else
      redirect_to :back
    end
  end

  private

  def load_blog
    @blogs = Post.find_by id: params[:id]
    unless @blogs
      flash[:danger] = t "blogs_not_found"
      redirect_to root_url
    end
  end
end
