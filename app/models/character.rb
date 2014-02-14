class Character < ActiveRecord::Base
  has_many :troopers
  has_many :missions, through: :troopers

  before_create :get_game_id

  private

  def get_game_id
    self.character_id = PS.get_character_id_by_name(name)
  end
end
