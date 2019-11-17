class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
        end
    end
end