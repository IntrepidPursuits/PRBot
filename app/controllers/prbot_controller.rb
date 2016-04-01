class PrbotController < ApplicationController
  def index
    render text:
    "PRBot Features:\n
    1. Submit a pull request                        `/pr {optional description} {github link}`\n
    2. View a list of open pull requests:           `/prlist`\n
    3. Approve a pull request for shipping:         `/ship @{username} /{pr number}`\n
    4. View a list of pull requests approved today  `/shiplist`\n
    5. Delete an open pull request (Hard delete)                  `/pr_del @{username} /{pr}`
    6. Add another channel to PRBot:                `/pr_web_hook {webhook link}\n
    7. See Channel Stats                            `/prstats`\n\n
    *Note*: Submitting a pull request that has already been approved will re-open it.
    "
  end
end
