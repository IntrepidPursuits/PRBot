class ShipMessenger < SlackMessenger
  private

  def text
    "#{creator_name} you can #{ship} #{pull_request.link}. #{compliment}"
  end

  def ship
    SHIP_SYMBOLS[rand(0..SHIP_SYMBOLS.size - 1)].to_s
  end

  def compliment
    COMPLIMENTS[rand(0..COMPLIMENTS.size - 1)].to_s
  end
end
