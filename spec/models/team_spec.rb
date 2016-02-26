require 'rails_helper'

describe Team do
  describe 'associations' do
    it { should have_many(:users) }
    it { should have_many(:channels) }
  end

  describe 'validations' do
    it { should validate_presence_of(:slack_team_id) }
    it { should validate_presence_of(:domain) }
  end
end
