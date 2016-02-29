require 'rails_helper'

describe 'PullRequestParser' do
  describe '.parse' do
    context 'with valid paramters' do
      context 'such as valid resources that do not exist' do
        it 'creates a new records for those resources' do          PullRequestParser.parse(create_pull_request_params)
          
          expect(PullRequest.all.size).to eq(1)
          expect(Team.all.size).to eq(1)
          expect(Channel.all.size).to eq(1)
          expect(User.all.size).to eq(1)
        end
      end

      context 'such as valid resources that do exist' do
        it 'finds the exisitng records for those resources' do
          team = create(:team)
          channel = create(:channel, team: team)
          user = create(:user, team: team)

          pull_request = PullRequestParser.parse(create_pull_request_params)
          
          expect(pull_request.team).to eq(team)
          expect(pull_request.channel).to eq(channel)
          expect(pull_request.user).to eq(user)
        end
      end
    end

    context 'with valid parameters' do
      context 'such as missing parameters' do
        it 'returns nil' do
          invalid_params = create_pull_request_params
          invalid_params.delete(:user_id)
          bad_pull_request = PullRequestParser.parse(invalid_params)

          expect(bad_pull_request).to eq(nil)
        end
      end
    end
  end
end
