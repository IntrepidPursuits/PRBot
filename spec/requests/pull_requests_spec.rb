require 'rails_helper'

describe 'Pull Requests Requests' do
  describe 'POST /pull_requests' do
    context 'with a valid parameters' do
      # request
      # token=RyPgoRCq4HvWQX1b37l6ivRQ
      # team_id=T0001
      # team_domain=example
      # channel_id=C2147483705
      # channel_name=test
      # user_id=U2147483697
      # user_name=Steve
      # command=/weather
      # text=94070
      # response_url=https://hooks.slack.com/commands/1234/5678
    end
    context 'with invalid parameters' do
      context 'such as without a pull request link' do
        xit 'responds with bad request' do 
        end
      end

      context 'such as with an invalid team' do
        xit 'responds with not found' do 
        end
      end
    end
  end
end
