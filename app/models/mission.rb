class Mission < ActiveRecord::Base
  belongs_to :user

  def to_s
    "#{name} (#{user.name})"
  end
end
