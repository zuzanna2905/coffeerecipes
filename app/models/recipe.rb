class Recipe < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: { minimum: 3, maximum: 50}
    validates :description, presence: false, length: { maximum: 5000}
end
