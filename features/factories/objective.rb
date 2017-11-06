FactoryGirl.define do
  factory :objective do
    association :tree
    title 'Knights Oath'
    description 'Swear the knights oath to with the trust of Knights of the Relm units'

    after(:create) do |objective, evaluator|
      if evaluator&.parent
        objective.parent = evaluator.parent
        objective.save
      end
    end
  end
end
