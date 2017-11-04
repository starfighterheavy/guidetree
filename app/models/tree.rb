require 'node'

class Tree < ActiveRecord::Base
  has_many :objectives
  belongs_to :user

  def roots
    objectives.roots
  end
end
