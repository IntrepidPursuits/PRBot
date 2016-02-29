class PullRequestsController < ApplicationController
  def index
    team = Team.find_by(slack_team_id: params[:team_id])
    channel = Channel.find_by(slack_channel_id: params[:channel_id])
    head :bad_request if team.nil? || channel.nil?
    pull_requests = PullRequest.where(approved_at: nil,
                                      team: team,
                                      channel: channel).all
    render pull_requests
  end

  def create
    pull_request = PullRequestParser.parse(params)
    head :bad_request if pull_request.nil?
    
    render json: pull_request
  end
end
