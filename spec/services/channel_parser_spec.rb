require 'rails_helper'

describe 'Channel Parser' do
  describe '.parse' do
    context 'with valid parameters' do
      it 'creates a new channel if one does not exist' do
        team = create(:team)

        ChannelParser.parse(create_pull_request_params, team)

        expect(Channel.all.size).to eq(1)
      end

      it 'finds the channel if one does exist' do
        team = create(:team)
        channel = create(:channel, team: team)

        ChannelParser.parse(create_pull_request_params, team)

        expect(Channel.all.size).to eq(1)
      end
    end

    context 'with invalid parameters' do
      it 'returns nil if the object cannnot be parsed' do
        team = create(:team)
        channel = create(:channel, team: team)
        invalid_params = create_pull_request_params
        invalid_params.delete(:channel_id)

        nil_channel = ChannelParser.parse(invalid_params, team)

        expect(nil_channel).to eq(nil)
      end
    end
  end
end
