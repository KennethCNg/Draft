module NameBrief
    extend ActiveSupport::Concern

    included do
        NAME_BRIEF_STORE = [
            "Basketball", 
            "Baseball", 
            "Football"
        ]

        def name_brief
            case NAME_BRIEF_STORE[self.sport_id - 1]
            when "Basketball"
                "#{self.first_name} #{self.last_name[0]}"
            when "Baseball"
                "#{self.first_name[0]} #{self.last_name[0]}"
            when "Football"
                "#{self.first_name[0]} #{self.last_name}"
            end
        end 
    end
end