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

   
    def make_exhibition_booking(exhibition)
        booking = Booking.create(curator_id: self.id, exhibition_id: exhibition.id, user_id: nil, artist_id:nil, reference_number:SecureRandom.hex(6))
        puts "Booking complete. Reference number - #{booking.reference_number}."
    end

    def view_bookings
        Booking.all.where("curator_id == ?", self.id)
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


    def view_exhibition_visitors(exhibition)
        Booking.all.where("exhibition_id == ?", exhibition.id).map{|x| x.visitor}
    end

    def exhibition_visitor_count(exhibition)
        self.view_exhibition_visitors(exhibition).length
    end



    def self.search_by_name(name)
        self.all.where("name == ?", name)
    end

    def self.search_by_location(location)
        self.all.where("location == ?", location)
    end



end