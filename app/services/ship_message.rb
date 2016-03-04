class ShipMessage
  attr_reader :pull_request
   def initialize(pull_request)
    @pull_request = pull_request
  end

  def message
    "Hey @#{pull_request.user.name}, you're all set to :shipit: #{pull_request.link}"
  end

  def self.message(pull_request)
    new(pull_request).message
  end
end
