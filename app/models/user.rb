class User < ApplicationRecord
  has_secure_password
  before_validation :generate_slug

  validates :first_name, :last_name, :username, :email, :password, presence: true
  validates :email, :username, uniqueness: true

  private

  def generate_slug
    self.slug = username.parameterize
  end

  def to_param
    slug
  end

  def self.from_omniauth(auth)
    user = where(provider: auth["provider"], uid: auth["uid"]).first_or_initialize.tap do |user|
      user.provider = auth['provider']
      user.first_name = auth['info']['first_name']
      user.last_name = auth['info']['last_name']
      user.email = auth['info']['email']
      user.avatar_url = auth['info']['image']
      user.username = auth['info']['name'].gsub(/\s+/, '')
      user.password = auth["info"]["last_name"]
      user.token = auth["credentials"]["token"]
      user.token_expiration = auth["credentials"]["expires_at"]
      user.save!
    end
    user
  end
end
