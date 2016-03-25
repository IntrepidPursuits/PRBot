class User < ActiveRecord::Base
  belongs_to :team
  has_many :pull_requests_as_approver, class_name: 'PullRequest', as: :approver

  validates :slack_user_id, presence: true
  validates :name, presence: true
  validates :team, presence: true
end
