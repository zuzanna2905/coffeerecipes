class Roaster < ApplicationRecord
    has_many :beans, dependent: :destroy
    has_many :recipes

    validates :name, presence: true, length: { minimum: 3, maximum: 50}
    validates :country, presence: true, length: { minimum: 2, maximum: 20}
end