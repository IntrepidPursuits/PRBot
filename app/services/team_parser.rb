class TeamParser
  def self.parse(params)
    team = Team.find_or_initialize_by(slack_team_id: params[:team_id])
    team.domain = params[:team_domain]
    team.token = params[:token]

    if team.save
      team
    else
      nil
    end
  end
end
