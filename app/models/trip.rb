class Trip < ApplicationRecord
    belongs_to :user
    has_many :trip_locations
    has_many :locations, through: :trip_locations

    # METHOD FOR DISPLAY OF FORMATTED TRIP CREATED_AT WHEN NO NAME IS RECORDED
    def disp_name
        if self.name == ""
            t = self.created_at.to_datetime
            "#{t.month}#{t.day}#{t.year} #{t.strftime("%k:%M")}" 
        else
            self.name
        end
    end
    
end
