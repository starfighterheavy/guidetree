require 'node'

class Tree < ActiveRecord::Base
  has_many :objectives
  belongs_to :user

  validates :public_uuid, presence: true

  before_validation do
    self.public_uuid ||= SecureRandom::uuid()
  end

  def roots
    objectives.roots
  end
end
