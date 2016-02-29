require 'rails_helper'

describe 'Pull Requests Requests' do
  describe 'POST /pull_requests' do
    context 'with a valid parameters' do
      it 'responds with ok' do
        post(pull_requests_url,
             create_pull_request_params.to_json,
             accept_headers)

        expect(response).to have_http_status :ok
      end
    end
    context 'with invalid parameters' do
      context 'such as without a pull request link' do
        xit 'responds with bad request' do 
        end
      end

      context 'such as a pull request link that already exists' do
        xit 'responds with bad request' do 
        end
      end

      context 'such as with an invalid team' do
        xit 'responds with not found' do 
        end
      end
    end
  end
  describe 'GET /pull_requests' do
    context 'with valid parameters' do
      it 'returns a list of pull requests for that team and channel' do
        team = create(:team)
        channel = create(:channel, team: team)

        get(pull_requests_url,
            create_pull_request_params,
            accept_headers)

        expect(response).to have_http_status :ok
        # expect(body)
      end
    end
  end
end
