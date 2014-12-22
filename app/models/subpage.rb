class Subpage < ActiveRecord::Base
  validates_presence_of :pagename, :text
end
