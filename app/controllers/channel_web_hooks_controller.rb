class ChannelWebHooksController < ApplicationController
  def create
    team = TeamParser.parse(params)
    channel = ChannelParser.parse(params, team)

    if channel.nil?
      head :bad_request 
    else
      channel.web_hook = WebHookParser.parse(params)
      channel.save
      if channel.web_hook.nil?
        head :bad_request        
      else
        render text: "Web hook for #{channel.name} set to #{channel.web_hook}"
      end
    end
  end
end
