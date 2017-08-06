class ObjectiveTrait < ActiveRecord::Base
  belongs_to :objective
  belongs_to :trait

  validates :amount, presence: true
end
