class StaticPagesController < ApplicationController
  def home
    @contact = Contact.new
    @key = Settings.link_map + ENV["GOOGLE_API_KEY"]
    @projects = Project.show_for_rating.take Settings.limit_project
    @home = Home.en.last
    if params[:locale] == Settings.language.vi
      @home = Home.vi.last
    elsif params[:locale] == Settings.language.ja
      @home = Home.ja.last
    end
  end
end
