require 'rails_helper'

describe 'Channel Parser' do
  describe '.parse' do
    context 'with valid parameters' do
      it 'creates a new user if one does not exist' do
        team = create(:team)

        UserParser.parse(create_pull_request_params, team)

        expect(User.all.size).to eq(1)
      end

      it 'finds the team if one does exist' do
        team = create(:team)
        user = create(:user, team: team)

        parsed_user = UserParser.parse(create_pull_request_params, team)

        expect(User.all.size).to eq(1)
        expect(parsed_user).to eq(user)
      end
    end
    context 'with invalid parameters' do
      it 'returns nil if the object cannnot be parsed' do
        team = create(:team)
        user = create(:user, team: team)
        invalid_params = create_pull_request_params
        invalid_params.delete(:user_id)

        nil_user = UserParser.parse(invalid_params, team)

        expect(nil_user).to eq(nil)
      end
    end
  end
end
