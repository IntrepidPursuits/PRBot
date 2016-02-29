class UserParser
  def self.parse(params, team)
    user = User.find_or_initialize_by(slack_user_id: params[:user_id])
    user.name = params[:user_name]
    user.team = team

    if user.save
      user
    else
      nil
    end
  end
end
