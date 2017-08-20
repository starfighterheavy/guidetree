FactoryGirl.define do
  factory :objective_trait do
    amount 10
    association :trait
    association :objective
  end
end
