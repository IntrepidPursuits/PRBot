class PullRequest < ActiveRecord::Base
  belongs_to :team
  belongs_to :channel
  belongs_to :user

  time_for_a_boolean :approved

  validates :approved, presence: true
  validates :message, presence: true
  validates :link, presence: true

  validates :team, presence: true
  validates :channel, presence: true
  validates :user, presence: true
end


