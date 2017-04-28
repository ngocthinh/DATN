class Admin::CertificationsController < Admin::AdminController
  load_and_authorize_resource

  def index
    @certifications = Certification.all.page(params[:page]).per Settings.per_page.admin_user
  end

  def edit
    @certification = Certification.find_by id: params[:id]
    respond_to do |format|
      format.html
      format.js do
        render partial: "admin/certifications/form",
          locals: {certification: @certification, button_text: t(".edit_button")},layout: false
      end
    end
  end

  def update
    @certification = Certification.find_by id: params[:id]
    @certification.update_attributes certification_params
    @certifications = Certification.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @certification = Certification.find_by id: params[:id]
    if @certification.destroy
      redirect_to admin_certifications_path
    else
      redirect_to :back
    end
  end

  private

  def certification_params
    params.require(:certification).permit :name, :description
  end
end
