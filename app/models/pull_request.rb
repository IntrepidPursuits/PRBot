class PullRequest < ActiveRecord::Base
  belongs_to :team
  belongs_to :channel
  belongs_to :user
  belongs_to :approver, class_name: 'User'

  time_for_a_boolean :approved

  validates :link, presence: true

  validates :team, presence: true
  validates :channel, presence: true
  validates :user, presence: true
end


