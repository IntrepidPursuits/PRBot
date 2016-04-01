class DeletePullRequestsController < ApplicationController
  def create
    pull_request = PullRequestParser.parse(params)
    if pull_request.nil?
      render text: 'There is no pull request with these parameters'
    elsif pull_request.approved?
      render text: 'PRBot does not delete approved pull requests.'
    else
      pull_request.destroy
      render text: 'Pull request deleted.'      
    end
  end
end
