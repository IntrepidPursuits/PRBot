class PullRequestParser
  attr_reader :params, :link
  
  def initialize(params)
    @params = params
  end

  def parse
    pull_request = PullRequest.find_or_initialize_by(link: link)
    pull_request.team = TeamParser.parse(params)
    return nil if pull_request.team.nil?
    pull_request.channel = ChannelParser.parse(params, pull_request.team)
    return nil if pull_request.channel.nil?
    pull_request.user = UserParser.parse(params, pull_request.team)
    return nil if pull_request.user.nil?
    pull_request.message = message
    if pull_request.save
      pull_request
    else
      nil
    end
  end

  def self.parse(params)
    new(params).parse
  end

  def link
    @link ||= params[:text].scan(/https:\/\/(github.com|bitbucket\.org)\/\S+\/(pull|pull-requests)\/\d+/).first
  end

  def message
    params[:text].gsub(/https:\/\/(github.com|bitbucket\.org)\/\S+\/(pull|pull-requests)\/\d+/, '')
  end
end
