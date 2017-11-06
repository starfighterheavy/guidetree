class Trait < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :user

  def name
    title
  end

  def keys
    to_h.keys
  end

  def to_h
    {
      title: title,
      description: description
    }
  end
end
