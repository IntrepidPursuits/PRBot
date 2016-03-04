class PullRequestMessage
  attr_reader :pull_requests
   def initialize(pull_requests)
    @pull_requests = pull_requests
  end

  def message
    body = "Open Pull Requests:"
    pull_requests.each do |pull_request|
      body += "\n* #{pull_request.user.name}'s: #{pull_request.link}"
    end
    body
  end

  def self.message(pull_requests)
    new(pull_requests).message
  end
end
