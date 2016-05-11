class ShipMessenger < SlackMessenger
  private

  def text
    "<@#{pull_request.user.name}> you can #{ship} #{pull_request.link}. #{compliment} - Approved by @#{pull_request.approver.name}"
  end

  def ship
    if pull_request.user.slack_user_id == 'U029DCSSN'
      ":bowie:"
    else
      SHIP_SYMBOLS[rand(0..SHIP_SYMBOLS.size - 1)].to_s
    end
  end

  def compliment
    COMPLIMENTS[rand(0..COMPLIMENTS.size - 1)].to_s
  end
end
