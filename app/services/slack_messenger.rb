class SlackMessenger
   attr_reader :pull_request

  def initialize(pull_request)
    @pull_request = pull_request
  end

  def post
    uri = URI.parse(ENV['SLACK_POST_URL'])
    params = { 'payload': payload }
    Net::HTTP.post_form(uri, params)
  end

  def self.post(pull_request)
    new(pull_request).post
  end

  private

  def channel_name
    "##{@pull_request.channel.name}"
  end

  def creator_name
    "@#{@pull_request.user.name}"
  end

  def link
    pull_request.link
  end

  def payload
    { 'channel': channel_name, 'username': 'prbot', 'text': text }.to_json
  end

  def text
    raise 'Subclass must define text'
  end
end
