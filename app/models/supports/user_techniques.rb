class Supports::UserTechniques

  def initialize user, params
    @user = user
    @params = params
  end

  def user_techniques
    if @params[:technique_ids].present?
      Technique.all.each do |technique|
        if @user.techniques.include? technique
          unless @params[:technique_ids].include? technique.id.to_s
            @user_technique = @user.target_techniques.find_by technique_id: technique.id
            @user_technique.destroy
          end
        elsif @params[:technique_ids].include? technique.id.to_s
          @user.target_techniques.create technique_id: technique.id
        end
      end
    else
      @user.target_techniques.destroy_all
    end
  end

  def user_certifications
    Certification.all.each do |certification|
      if @user.certifications.include? certification
        unless @params[:user][:certification_ids].include? certification.id.to_s
          @user_certification = @user.certificate_users.find_by certification_id: certification.id
          @user_certification.destroy
        end
      elsif @params[:user][:certification_ids].include? certification.id.to_s
        @user_certification = @user.certificate_users.create certification_id: certification.id
      end
    end
  end
end
