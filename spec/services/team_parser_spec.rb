require 'rails_helper'

describe 'Team Parser' do
  describe '.parse' do
    context 'with valid parameters' do
      it 'creates a new team if one does not exist' do
        TeamParser.parse(create_pull_request_params)

        expect(Team.all.size).to eq(1)
      end

      it 'finds the team if one does exist' do
        team = create(:team)

        parsed_team = TeamParser.parse(create_pull_request_params)

        expect(Team.all.size).to eq(1)
        expect(parsed_team).to eq(team)
      end
    end

    context 'with invalid paramters' do
      it 'returns nil if the object cannnot be parsed' do
        team = create(:team)
        invalid_params = create_pull_request_params
        invalid_params.delete(:team_id)

        nil_team = TeamParser.parse(invalid_params)

        expect(nil_team).to eq(nil)
      end
    end
  end
end
