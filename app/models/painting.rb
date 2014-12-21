class Painting < ActiveRecord::Base
  belongs_to :artist
  belongs_to :category
  validates :title, :artist_id, :body, :image, :category_id, presence: true
  validates_uniqueness_of :title
  validates :year, numericality: { only_integer: true, greater_than: 1400, less_than_or_equal_to: 2015 }
  mount_uploader :image, ImageUploader
end
