class Admin::CategoriesController < Admin::AdminController
  load_and_authorize_resource

  def update
    @category = Category.find_by id: params[:id]
    @category.update_attributes category_params
    respond_to_json t(".success"), 200, @category.name
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
