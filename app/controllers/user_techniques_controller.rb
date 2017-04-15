class UserTechniquesController < ApplicationController

  def index
    @category = Category.find_by id: params[:id]
    @techniques = @category.techniques
    respond_to do |format|
      format.html
      format.js do
        render partial: "shared/choose_technique", locals: {object: current_user, techniques: @techniques}, layout: false
      end
    end
  end
end
