class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :role, presence: true
  has_secure_password
  enum role: %w(default admin)
  has_many :favorites
  has_many :gifs, through: :favorites

  after_initialize :set_defaults

  def set_defaults
    if self.new_record?
      self.role ||= :default
    end
  end
end
