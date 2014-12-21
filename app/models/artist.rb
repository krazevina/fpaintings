class Artist < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 5 }
  validates_uniqueness_of :name
  validates_presence_of :nationality, :intro, :img
  has_many :paintings
  validates :born, :died, numericality: { only_integer: true, greater_than: 1300, less_than_or_equal_to: 2015 }
  mount_uploader :image, ImageUploader
  def to_s
    "#{name}"
  end
end
