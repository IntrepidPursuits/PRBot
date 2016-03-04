class PullRequestsController < ApplicationController
  def index
    team = Team.find_by(slack_team_id: params[:team_id])
    channel = Channel.find_by(slack_channel_id: params[:channel_id])
    if  team.nil? || channel.nil?
      head :bad_request
    else
      pull_requests = PullRequest.where(approved_at: nil,
                                      team: team,
                                      channel: channel).all
      render json: pull_requests
    end
  end

  def create
    pull_request = PullRequestParser.parse(params)
    if pull_request.nil?
      head :bad_request 
    else
      render text: "thanks #{pull_request.user.name}! #{COMPLIMENTS[rand(0..COMPLIMENTS.size - 1)].to_s}"
    end
  end
end
