class Release < ActiveRecord::Base
  belongs_to :project
  has_many :release_items, :dependent => :destroy
end
