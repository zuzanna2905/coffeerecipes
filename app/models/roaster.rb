class Roaster < ApplicationRecord
    has_many :beans, dependent: :destroy
    has_many :recipe
end