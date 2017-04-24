class Admin::TechniquesController < Admin::AdminController
  load_and_authorize_resource

  def index
    @category = Category.find_by id: params[:id]
    @techniques = @category.techniques
    respond_to do |format|
      format.html
      format.js do
        render partial: "admin/users/techniques",
          locals: {techniques: @techniques, button_text: t(".show_techniques")},layout: false
      end
    end
  end

  def create
    @category = Category.find_by id: params[:category_id]
    @category.techniques.create skill: params[:technique_name]
    @techniques = @category.techniques
    respond_to do |format|
      format.html
      format.js do
        render partial: "admin/users/techniques",
          locals: {techniques: @techniques, button_text: t(".show_techniques")},layout: false
      end
    end
  end

  private

  def respond_to_json message, status, name = nil
     respond_to do |format|
       format.json{render json: {flash: message, status: status, techniques: @techniques}}
     end
  end
end
