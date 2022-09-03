class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
  include DeviseTokenAuth::Concerns::User
  before_create :skip_confirmation!

  has_many :qcms

  def confirmed?
    true
  end
end
