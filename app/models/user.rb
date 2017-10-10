class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  has_secure_password

  validates :first_name, :last_name, :username, :email, :password, presence: true
  validates :email, :username, uniqueness: true

  enum role: %w(registered_user admin)

  private

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
