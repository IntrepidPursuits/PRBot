require 'rails_helper'

describe User do
  describe 'associations' do
    it { should belong_to(:team) }
  end

  describe 'validations' do
    it { should validate_presence_of(:slack_user_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:team) }
  end
end
