class Favorite < ApplicationRecord
    belongs_to :recipe, foreign_key: "recipe_id"
    belongs_to :user, foreign_key: "user_id"
end