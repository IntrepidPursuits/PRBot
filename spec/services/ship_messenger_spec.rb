require 'rails_helper'

describe 'Ship Messenger' do
  describe '.post' do
    context 'with valid params' do
      it 'returns the slack response status 200' do
        valid_ship_message_stub

        team = create(:team, :with_user)
        channel = create(:channel, :with_web_hook, team: team)
        pull_request = create(:pull_request,
                              team: team,
                              user: team.users.first,
                              channel: channel)

        code = ShipMessenger.post(pull_request)
        expect(code).to eq('200')
      end
    end

    context 'with invalid params' do
      context 'like a missing web hook url' do
        it 'returns nil' do
          team = create(:team, :with_user)
          channel = create(:channel, team: team)
          pull_request = create(:pull_request,
                                team: team,
                                user: team.users.first,
                                channel: channel)

          code = ShipMessenger.post(pull_request)
          expect(code).to eq(nil)
        end
      end
      context 'like a nil pull request' do
        it 'returns nil' do
          code = ShipMessenger.post(nil)
          expect(code).to eq(nil)
        end
      end
    end
  end
end
