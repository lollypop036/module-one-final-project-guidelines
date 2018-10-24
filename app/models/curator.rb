class Curator <  ActiveRecord::Base
    has_many :exhibitions
    has_many :collaborations, through: :exhibitions
    has_many :artists, through: :collaborations
    has_many :bookings, through: :exhibitions
    has_many :users, through: :bookings

    def create_exhibition(name, date, location, time)
        Exhibition.create(name: name, date: date, location: location, time: time, artist_id: nil, curator_id: self.id)
    end

    def get_exhibitions
        Exhibition.where("curator_id = ?", self.id)
    end

    def get_previous_exhibitions(today_date)
        get_exhibitions.select{|e| Date.parse(e.date) < today_date}
    end

    def get_upcoming_exhibitions(today_date)
        get_exhibitions.select{|e| Date.parse(e.date) >= today_date}
    end

    def search_for_collaborations
        Collaboration.all
    end

    def assign_collaboration_to_exhibition(collaboration, exhibition)
        collaboration.exhibition_id = exhibition.id
    end

    def assign_style_to_exhibition(style, exhibition)
        exhibition.style = style
    end

    def self.search_credentials(username, password)
        if self.find_by(username: username, password: password)
            #self.find_by(username: username, password: password)
            true
        else
            false
        end
    end

    def self.get_curator(username, password)
        self.find_by(username: username, password: password)
    end

end