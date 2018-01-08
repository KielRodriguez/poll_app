FactoryBot.define do
  factory :token do
    expires_at "2017-12-31 17:39:12"
    association :user, factory: :user
  end
end
