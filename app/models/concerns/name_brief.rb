module NameBrief
    extend ActiveSupport::Concern

    included do
        NAME_BRIEF_DICTIONARY = {
            "Basketball" => Proc.new { |player| "#{player.first_name} #{player.last_name[0]}." },
            "Baseball" => Proc.new { |player| "#{player.first_name[0]}. #{player.last_name[0]}." },
            "Football" => Proc.new { |player| "#{player.first_name[0]}. #{player.last_name}" }
        }.freeze

        def name_brief
            name_brief_proc = NAME_BRIEF_DICTIONARY[self.sport.sport_name]
            name_brief_proc.call(self)
        end 
    end
end