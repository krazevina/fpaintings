class Painting < ActiveRecord::Base
  belongs_to :artist
  belongs_to :category
  validates :title, :artist_id, :body, :image, :category_id, presence: true
  validates_uniqueness_of :title
  mount_uploader :image, ImageUploader
end
