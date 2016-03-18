class PullRequestsController < ApplicationController
  def index
    team = Team.find_by(slack_team_id: params[:team_id])
    channel = Channel.find_by(slack_channel_id: params[:channel_id])
    if  team.nil? || channel.nil?
      head :bad_request
    else
      pull_requests = PullRequest.includes(:user).where(approved_at: nil,
                                      team: team,
                                      channel: channel).all
      render text: PullRequestMessage.message(pull_requests)
    end
  end

  def create
    pull_request = PullRequestParser.parse(params)
    if pull_request.nil?
      head :bad_request 
    else
      response_code = PullRequestMessenger.post(pull_request)
      if response_code == '200'
        render text: "Pull request received! #{COMPLIMENTS[rand(0..COMPLIMENTS.size - 1)].to_s}"
      else
        head :bad_request 
      end
    end
  end
end
