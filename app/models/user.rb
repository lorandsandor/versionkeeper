class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable,
     :omniauthable, :omniauth_providers => [:github]

  has_many :authentications, class_name: UserAuthentication, dependent: :destroy
  has_many :project_memberships
  has_many :projects,
    -> { distinct },
    :through => :project_memberships,
    :class_name => 'Project'

  def self.create_from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end
end
