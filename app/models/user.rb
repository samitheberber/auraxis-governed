class User < ActiveRecord::Base
  devise :omniauthable, omniauth_providers: [:steam]

  def self.find_for_steam_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name   # assuming the user model has a name
      #user.image = auth.info.image # assuming the user model has an image
      user.save!
    end
  end

  has_many :missions
end
