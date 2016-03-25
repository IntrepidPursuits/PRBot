class PrbotController < ApplicationController
  def index
    render text:
    "PRBot Features:\n
    1. Submit a pull request                /pr {optional description} {github link}\n
    2. View a list of open pull requests:   /prlist\n
    3. Approve a pull request for shipping: /ship @{username} /{pr number}\n
    4. Add another channel to PRBot:        /pr_web_hook {webhook link}
    "
  end
end
