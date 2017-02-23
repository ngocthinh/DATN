class Admin::HomesController < Admin::AdminController
  before_action :authenticate_user!
  #load_and_authorize_resource

  def new
    @home = Home.new
    @home.images.build
  end

  def create
    @home = Home.new home_params
    if @home.save
      flash[:success] = t "home_pages.created"
      redirect_to admin_root_path
    else
      flash[:danger] = t "images.create_failed"
      render :new
    end
  end

  private

  def home_params
    params.require(:home).permit :title, :sologan, :description,
      :language, images_attributes: [:id, :image, :image_cache, :_destroy]
  end
end
