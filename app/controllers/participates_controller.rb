class ParticipatesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_project, only: [:create, :index, :destroy]
  before_action :load_participate, only: [:destroy, :show]
  def index
    @q = User.member_project(@project.participates.pluck :user_id).ransack params[:q]
    @users = @q.result.page(params[:page]).per Settings.per_page.user
    @participates = @project.participates
  end

  def new
  end

  def create
    @participate = @project.participates.find_by user_id: participate_params[:user_id]
    if @participate
      flash[:danger] = t "available"
    else
      @participate = Participate.new participate_params
      if @participate.save
        flash[:success] = t "participates.created"
      else
        flash[:danger] = t "participates.create_failed"
      end
    end
    respond_to do |format|
      format.html { redirect_to project_participates_path(I18n.locale, @project) }
      format.js
    end
  end

  def destroy
    if @participate.destroy
      flash[:success] = t "participates.deleted"
    else
      flash[:success] = t "participates.delete_failed"
    end
    respond_to do |format|
      format.html { redirect_to project_participates_path(I18n.locale, @project) }
      format.js
    end
  end

  private
  def participate_params
    params.require(:participate).permit(:position, :user_id, :project_id)
      .merge is_accept: true
  end

  def load_project
    @project = Project.find_by id: params[:project_id]
    unless @project
      flash[:danger] = t "project_not_found"
      redirect_to root_url
    end
  end

  def load_participate
    @participate = Participate.find_by id: params[:id]
    unless @participate
      flash[:danger] = t "user_not_found"
      redirect_to root_url
    end
  end
end
