require 'rails_helper'

describe Channel do
  describe 'associations' do
    it { should belong_to(:team) }
  end

  describe 'validations' do
    it { should validate_presence_of(:slack_channel_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:team) }
  end
end
