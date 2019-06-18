class Bean < ApplicationRecord
    belongs_to :roaster, foreign_key: "roaster_id"
end