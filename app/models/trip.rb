class Trip < ApplicationRecord
    belongs_to :user
    # belongs_to :location, optional: true
    has_many :trip_locations
    has_many :locations, through: :trip_locations

    def disp_name
        if self.name == ""
            t = self.created_at.to_datetime
            # "#{Date::MONTHNAMES[t.month]} #{t.day}, #{t.year} at #{t.strftime("%k:%M")}" 
            "#{t.month}#{t.day}#{t.year} #{t.strftime("%k:%M")}" 
        else
            self.name
        end
    end
    
end
