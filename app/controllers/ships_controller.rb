class ShipsController < ApplicationController
  def create
    pull_request = ShipParser.parse(params)
    if pull_request.nil?
      render text: "that pull request doesn't exist or is already approved!"
    else
      pull_request.approved = true
      pull_request.save

      response_code = ShipMessenger.post(pull_request)
      if response_code == '200'
        render text: "Ship Recorded."
      else
        head :bad_request 
      end
    end
  end
end
