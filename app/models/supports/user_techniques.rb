class Supports::UserTechniques

  def initialize user, params
    @user = user
    @params = params
  end

  def user_techniques
    if @params.present?
      Technique.all.each do |technique|
        if @user.techniques.include? technique
          unless @params.include? technique.id.to_s
            @user_technique = TargetTechnique.find_by technique_id: technique.id
            @user_technique.destroy
          end
        elsif @params.include? technique.id.to_s
          @user.target_techniques.create technique_id: technique.id
        end
      end
    else
      @user.target_techniques.destroy_all
    end
  end
end
