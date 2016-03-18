FactoryGirl.define do
  factory :channel do
    slack_channel_id 'C2147483705'
    name 'test'
    team

    trait :with_web_hook do
      web_hook 'https://hooks.slack.com/services/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'
    end
  end
end
