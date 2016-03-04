class ShipMessage
  attr_reader :pull_request
   def initialize(pull_request)
    @pull_request = pull_request
  end

  def message
    "Hey @#{pull_request.user.name}, :shipit: #{pull_request.link}. #{COMPLIMENTS[rand(0..COMPLIMENTS.size - 1)].to_s}"
  end

  def self.message(pull_request)
    new(pull_request).message
  end
end
