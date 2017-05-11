class Admin::CategoriesController < Admin::AdminController
  load_and_authorize_resource

  def new
    @category = Category.new
  end

  def create
    @category = Category.find_by id: params[:id]
    @category = Category.new category_params
    if @category.save
      @category.project!
      redirect_to admin_categories_url
    else
      flash[:danger] = t "create_category_fail"
      render :index
    end
  end

  def index
    @categories = Category.project.page(params[:page]).per 5
  end

  def update
    @category = Category.find_by id: params[:id]
    @category.update_attributes category_params
    respond_to_json t(".success"), 200, @category.name
  end

  def destroy
    @category = Category.find_by id: params[:id]
    if @category.destroy
      redirect_to admin_categories_path
    else
      redirect_to :back
    end
  end

  private

  def category_params
    params.require(:category).permit :name
  end

  def respond_to_json message, status, name = nil
     respond_to do |format|
       format.json{render json: {flash: message, status: status, name: name}}
     end
  end
end
