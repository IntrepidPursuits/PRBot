class Team < ActiveRecord::Base
  has_many :channels
  has_many :users

  validates :slack_team_id, presence: true
  validates :domain, presence: true
  validates :token, presence: true
end
