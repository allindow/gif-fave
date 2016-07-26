class Favorite < ActiveRecord::Base
  belongs_to :gif
  belongs_to :user
  validates :gif, presence: true
  validates :user, presence: true
  validates_uniqueness_of :gif_id, scope: :user_id

end
