require "net/http"
require "uri"

class PullRequestMessenger < SlackMessenger
  private

  def text
    "New Pull Request by #{creator_name} - #{message} #{link}"
  end

  def message
    @pull_request.message
  end
end
