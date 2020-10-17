class Trip < ApplicationRecord
    belongs_to :user
    # belongs_to :location, optional: true
    has_many :trip_locations
    has_many :locations, through: :trip_locations

    def disp_name
        if self.name == ""
            self.created_at
        else
            self.name
        end
    end
    
end
