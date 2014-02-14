class Mission < ActiveRecord::Base
  belongs_to :user

  has_many :troopers
  has_many :characters, through: :troopers

  def to_s
    "#{name} (#{user.name})"
  end
end
