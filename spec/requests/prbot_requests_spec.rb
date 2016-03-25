require 'rails_helper'

describe 'PRBot Requests' do
  describe 'GET /prbot' do
    context 'with a valid parameters' do
      it 'responds with instructions on how to use the app' do
        get(prbot_index_url)

        expect(response).to have_http_status :ok
      end
    end
  end
end
