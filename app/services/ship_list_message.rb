require 'action_view'
include ActionView::Helpers::DateHelper 

class ShiplistMessage
  attr_reader :pull_requests
   def initialize(pull_requests)
    @pull_requests = pull_requests
  end

  def message
    body = "Todays Approved Pull Requests:"
    if pull_requests.count < 1
      body = "There are currently no pull requests approved for today."
    else
      pull_requests.each do |pull_request|
        body << "\n* #{pull_request.user.name}'s: #{pull_request.link}"
        if pull_request.approver.present?
          body << " - approved by #{pull_request.approver.name} #{time_ago(pull_request)} ago"
        end
      end
    end
    body
  end

  def self.message(pull_requests)
    new(pull_requests).message
  end

  private

  def time_ago(pull_request)
    distance_of_time_in_words(pull_request.approved_at, Time.now)
  end
end
