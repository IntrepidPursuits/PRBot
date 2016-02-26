class PullRequestsController < ApplicationController
  def create
    render json: params
  end
end
