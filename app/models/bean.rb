class Bean < ApplicationRecord
    belongs_to :roaster, foreign_key: "roaster_id"
    has_many :recipes
    validates :name, presence: true, length: { minimum: 3, maximum: 50}
    validates :roaster_id, presence: true
    validates :method, presence: true, length: { minimum: 3, maximum: 20}
    validates :country, presence: true, length: { minimum: 2, maximum: 20}
    validates :roast, presence: true, length: { minimum: 3, maximum: 20}
end