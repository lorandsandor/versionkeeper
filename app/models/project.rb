class Project < ActiveRecord::Base
  validates_presence_of :name

  has_many :applications, :dependent => :destroy
  has_many :releases, :dependent => :destroy

  accepts_nested_attributes_for :applications,
    reject_if: proc { |attributes| attributes['name'].blank? },
    allow_destroy: true
end
