class ChannelParser
  def self.parse(params, team)
    channel = Channel.find_or_initialize_by(slack_channel_id: params[:channel_id])
    channel.name = params[:channel_name]
    channel.team = team

    if channel.save
      channel
    else
      nil
    end
  end
end
