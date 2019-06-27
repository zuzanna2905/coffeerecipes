class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :roaster, foreign_key: "roaster_id"
    belongs_to :bean, foreign_key: "bean_id"
    has_many :favorites

    def self.search(search)
        if search
          joins(:bean).where("beans.name like ?", "%#{search}%").all
        else
          all
        end
    end

end