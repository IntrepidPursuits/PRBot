FactoryGirl.define do
  factory :pull_request do
    approved_at nil
    message 'pr to solve a rubix cude'
    link 'https://github.com/IntrepidPursuits/follow-app-server/pull/125'
    team
    channel
    user
  end
end
