class Repository < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :project
end
