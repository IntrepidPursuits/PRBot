require 'rails_helper'

describe PullRequest do
  describe 'associations' do
    it { should belong_to(:team) }
    it { should belong_to(:user) }
    it { should belong_to(:channel) }
  end

  describe 'validations' do
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:link) }
    it { should validate_presence_of(:team) }
    it { should validate_presence_of(:channel) }
    it { should validate_presence_of(:user) }
  end
end
