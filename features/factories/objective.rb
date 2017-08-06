FactoryGirl.define do
  factory :objective do
    title 'Knights Oath'
    description 'Swear the knights oath to with the trust of Knights of the Relm units'

    transient do
      parent nil
    end

    after(:create) do |objective, evaluator|
      if evaluator&.parent
        parent = Objective.find_by(title: evaluator.parent)
        Dependency.create!(parent: parent, child: objective)
      end
    end
  end
end
