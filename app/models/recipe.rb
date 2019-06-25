class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :roaster, foreign_key: "roaster_id"
    belongs_to :bean, foreign_key: "bean_id"
    has_many :favorites
end