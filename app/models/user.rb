class User < ActiveRecord::Base
  belongs_to :team

  validates :slack_user_id, presence: true
  validates :name, presence: true
  validates :team, presence: true
end
