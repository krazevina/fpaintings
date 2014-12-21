class Category < ActiveRecord::Base
  has_many :paintings
  validates_presence_of :nametype
  def to_s
    "#{nametype}"
  end
end
