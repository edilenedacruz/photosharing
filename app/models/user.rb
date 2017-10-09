class User < ApplicationRecord
  has_secure_password
  before_validation :generate_slug

  validates :first_name, :last_name, :username, :email, :password, :phone, presence: true
  validates :email, :username, uniqueness: true

  private

  def generate_slug
    self.slug = username.parameterize
  end

  def to_param
    slug
  end
end
