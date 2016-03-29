class Project < ActiveRecord::Base
  validates_presence_of :name

  has_many :repositories, :dependent => :destroy
  has_many :releases, :dependent => :destroy

  has_many :project_memberships
  has_many :users,
    -> { uniq },
    :through => :project_memberships

  accepts_nested_attributes_for :repositories,
    reject_if: proc { |attributes| attributes['name'].blank? },
    allow_destroy: true
end
