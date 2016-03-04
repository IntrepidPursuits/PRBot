class ShipsController < ApplicationController
  def create
    pull_request = ShipParser.parse(params)
    if pull_request.nil?
      render text: "that pull request is already approved!"
    else
      pull_request.approved = true
      pull_request.save
      message = ShipMessage.message(pull_request)
      render text: message
    end
  end
end
