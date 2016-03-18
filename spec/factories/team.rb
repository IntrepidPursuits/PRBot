FactoryGirl.define do
  factory :team do
    token 'RyPgoRCq4HvWQX1b37l6ivRQ'
    slack_team_id 'T0001'
    domain 'example'

    trait :with_user do
      after :create do |object, evaluator|
        create(:user, team: object)
      end
    end

    trait :with_channel do
      after :create do |object, evaluator|
        create(:channel, team: object)
      end
    end
  end
end
