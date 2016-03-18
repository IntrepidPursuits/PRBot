require "net/http"
require "uri"

class Slack
  attr_reader :pull_request

  def initialize(pull_request)
    @pull_request = pull_request
  end

  def post
    uri = URI.parse(ENV['SLACK_POST_URL'])
    params = {'channel': "@slackbot", 'username': 'prbot', 'text': "New Pull Request by #{creator_name}: #{message} #{link}"}
    Net::HTTP.post_form(uri, params)
  end

  def self.post(pull_request)
    new(pull_request).post
  end

  private

  def channel_name
    @pull_request.channel.name
  end

  def creator_name
    @pull_request.user.name
  end

  def message
    @pull_request.message
  end

  def link
    pull_request.link
  end
end
