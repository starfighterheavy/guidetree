class ObjectiveTrait < ActiveRecord::Base
  belongs_to :objective
  belongs_to :trait

  delegate :title, :description, to: :trait

  validates :amount, presence: true
end
