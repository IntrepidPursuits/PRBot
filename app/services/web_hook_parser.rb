class WebHookParser
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def parse
    link
  end

  def self.parse(params)
    new(params).parse
  end

  private

  def link
    @link ||= @params[:text].scan(/https:\/\/hooks.slack.com\/services\/\S+/).first
  end
end
