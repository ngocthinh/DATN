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
    @technique = @category.techniques.create technique_params
    respond_to do |format|
      format.html
      format.js do
        render partial: "admin/users/technique",
          locals: {technique: @technique, button_text: t(".show_techniques")},layout: false
      end
    end
  end

  def destroy
    @technique = Technique.find_by id: params[:id]
    if @technique.destroy
       respond_to_json t(".success"), 200
     else
       respond_to_json t(".fail"), 400
     end
  end

  def update
    @technique = Technique.find_by id: params[:id]
    @technique.update_attributes technique_params
    respond_to_json t(".success"), 200, @technique.skill
  end

  private

  def technique_params
    params.require(:technique).permit :skill
  end

  def respond_to_json message, status, skill = nil
     respond_to do |format|
       format.json{render json: {flash: message, status: status, skill: skill}}
     end
  end
end
