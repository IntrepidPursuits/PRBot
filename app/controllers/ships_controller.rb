class shipsController < ApplicationController
  def create
    pull_request = ShipParser.parse(params)
    pull_request.approved = true
    message = ShipMessage.message(pull_request)
    render json: message
  end
end
