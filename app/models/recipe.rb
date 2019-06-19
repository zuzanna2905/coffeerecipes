class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :roaster
    belongs_to :bean
end