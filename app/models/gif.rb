class Gif < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites
  validates :category, presence: true
  validates :image_path, presence: true

  def category_name
    Category.find(category_id).name
  end

  def self.all_by_category
    all.group_by { |x| x.category }
  end

end
