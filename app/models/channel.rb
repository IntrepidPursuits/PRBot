class Channel < ActiveRecord::Base
  belongs_to :team

  validates :slack_channel_id, presence: true
  validates :name, presence: true
  validates :team, presence: true
end
