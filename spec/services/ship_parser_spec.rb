require 'rails_helper'

describe 'Ship Parser' do
  describe '.parse' do
    context 'with valid parameters' do
      it 'finds the requested pull request' do
        team = create(:team)
        channel = create(:channel, team: team)
        user = create(:user, team: team)
        
        pull_request = create(:pull_request,
                              team: team,
                              channel: channel,
                              user: user)

        pull_request_found = ShipParser.parse(create_ship_request_params)
        
        expect(pull_request_found).to eq(pull_request)
      end
    end

    context 'with invalid parameters' do
      context 'such as an invalid user in text' do
        it 'finds the requested pull request' do
          team = create(:team)
          channel = create(:channel, team: team)
          user = create(:user, team: team)
          
          pull_request = create(:pull_request,
                                team: team,
                                channel: channel,
                                user: user)

          pull_request_found = ShipParser.parse(invalid_user_create_ship_request_params)
          
          expect(pull_request_found).to eq(nil)
        end
      end

      context 'such as an invalid pull request number in text' do
        it 'finds the requested pull request' do
          team = create(:team)
          channel = create(:channel, team: team)
          user = create(:user, team: team)
          
          pull_request = create(:pull_request,
                                team: team,
                                channel: channel,
                                user: user)

          pull_request_found = ShipParser.parse(invalid_number_create_ship_request_params)
          
          expect(pull_request_found).to eq(nil)
        end
      end
    end
  end
end
