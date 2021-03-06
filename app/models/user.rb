class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { minimum: 3, maximum: 20}
    VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
              uniqueness: {case_sensitive: false},
              length: { minimum: 5, maximum: 50},
              format: { with: VALID_EMAIL_REGEX }
    has_secure_password
    validates :password_confirmation, presence: true
    has_many :recipes, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
end