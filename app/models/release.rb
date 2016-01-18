class Release < ActiveRecord::Base
  belongs_to :project
  has_many :release_items, :dependent => :destroy

  validates_presence_of :date

  accepts_nested_attributes_for :release_items,
    reject_if: proc { |attributes| attributes['version'].blank? },
    allow_destroy: true
end
