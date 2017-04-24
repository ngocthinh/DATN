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
end
