class ShipsController < ApplicationController
  def create
    pull_request = ShipParser.parse(params)
    if pull_request.nil?
      render text: "that pull request doesn't exist or is already approved!"
    else
      pull_request.approved = true

      approver= UserParser.parse(params, pull_request.team)
      pull_request.approver = approver
      if pull_request.save

        response_code = ShipMessenger.post(pull_request)
        if response_code == '200'
          render text: 'Ship Recorded.'
        else
          render text: 'Ship recorded. The web hook appears to be responding slowly.'
        end
      else
        render text: 'Failed to approver this pull request. Might be a problem with the user information.'
      end
    end
  end
end
