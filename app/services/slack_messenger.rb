class SlackMessenger
   attr_reader :pull_request

  def initialize(pull_request)
    @pull_request = pull_request
  end

  def post
    if pull_request.nil? || channel_url.nil?
      return nil
    else
      uri = URI.parse(channel_url)
      params = { 'payload': payload }
      response = Net::HTTP.post_form(uri, params)
      response.code
    end
  end

  def self.post(pull_request)
    new(pull_request).post
  end

  private

  def channel_name
    "##{pull_request.channel.name}"
  end

  def channel_url
    pull_request.channel.web_hook
  end

  def creator_name
    "@#{pull_request.user.name}"
  end

  def link
    pull_request.link
  end

  def payload
    { 'channel': channel_name, 'username': 'prbot', 'text': text, "link_names": 1 }.to_json
  end

  def text
    raise 'Subclass must define text'
  end
end
