class Mission < ActiveRecord::Base
  belongs_to :user

  has_many :troopers
  has_many :characters, through: :troopers

  validates :name, presence: true, length: { minimum: 3}
  validates :server, presence: true, length: { minimum: 3}
  validates :faction, presence: true, length: { minimum: 2}

  def assign_trooper name
    character = Character.find_or_create_by name
    self.characters << character
  end

  def to_s
    "#{name} (#{user.name})"
  end
end
