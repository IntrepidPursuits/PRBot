require 'rails_helper'

describe 'Ships Requests' do
  describe 'GET /ship' do
    context 'with a valid parameters' do
      context 'if pull requests have been approved that day' do
        it 'returns the list of approved pull requests' do
          team = create(:team)
          channel = create(:channel, team: team)

          user = create(:user, team: team)
          approver = create(:user,
                            team: team,
                            slack_user_id: 'U2147483600',
                            name: 'Stan')

          pull_request = create(:pull_request,
                                team: team,
                                channel: channel,
                                user: user,
                                approver: approver,
                                approved_at: Time.now)

          get(ships_url,
              create_pull_request_params,
              accept_headers)
          
          expect(response).to have_http_status :ok          
          expect(body).to include(approver.name)
          expect(body).to include(user.name)
          expect(body).to include(pull_request.link)
        end
      end
      context 'if pull requests have not been approved that day' do
        it 'returns a message' do
          team = create(:team)
          channel = create(:channel, team: team)

          get(ships_url,
              create_pull_request_params,
              accept_headers)

          expect(response).to have_http_status :ok
          expect(body).to eq("There are currently no pull requests approved for today.")
        end
      end
    end
  end
end
