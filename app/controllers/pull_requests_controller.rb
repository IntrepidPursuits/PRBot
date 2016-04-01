class PullRequestsController < ApplicationController
  def index
    team = Team.find_by(slack_team_id: params[:team_id])
    channel = Channel.find_by(slack_channel_id: params[:channel_id])
    if  team.nil? || channel.nil?
      render text: "Something went wrong, PRBot can't find your team or channel"
    else
      pull_requests = PullRequest.includes(:user).where(approved_at: nil,
                                      team: team,
                                      channel: channel).all
      render text: PullRequestListMessage.message(pull_requests)
    end
  end

  def create
    pull_request = PullRequestParser.parse(params)
    if pull_request.nil?
      render text: 'PRBot could not find a pull request in this message. Please include the full github link.' 
    else
      response_code = PullRequestMessenger.post(pull_request)
      if response_code == '200'
        render text: "Pull request received! #{COMPLIMENTS[rand(0..COMPLIMENTS.size - 1)].to_s}"
      elsif response_code.nil?
        render text: "Please add a web hook url so that prbot can post in #{pull_request.channel.name}", status: :bad_request
      else
        render text: "Pull request recorded. The web hook appears to be responding slowly."
      end
    end
  end
end
