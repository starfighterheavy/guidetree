class Dependency < ActiveRecord::Base
  belongs_to :parent, class_name: :Objective
  belongs_to :child, class_name: :Objective
end
