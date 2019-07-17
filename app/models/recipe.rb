class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :roaster, foreign_key: "roaster_id"
    belongs_to :bean, foreign_key: "bean_id"
    has_many :favorites
    has_many :comments

    validates :user_id, presence: true
    validates :roaster_id, presence: true
    validates :bean_id, presence: true
    validates :temperature, presence: true
    validates :water, presence: true
    validates :dose, presence: true
    validates :method, presence: true
    validates :time, presence: true
    validates :rate, presence: true

    def self.search(search)
        if search
          joins(:bean).where("beans.name like ?", "%#{search}%").order(likes: :desc)
        else
          all.order(likes: :desc)
        end
    end

end