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
    Rails.cache.delete("/mission/#{id}/troopers")
  end

  def troopers_data
    Rails.cache.fetch("/mission/#{id}/troopers", expires_in: 1.minute) do
      PS.get_characters_by_ids(self.characters.map(&:character_id))
    end
  end

  def to_s
    "#{name} (#{user.name})"
  end
end
