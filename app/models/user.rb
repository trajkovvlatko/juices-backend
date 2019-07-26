class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :likes, dependent: :destroy
end
