class Project < ActiveRecord::Base
  validates_presence_of :name
  has_many :applications, :dependent => :destroy
  has_many :releases, :dependent => :destroy
end
