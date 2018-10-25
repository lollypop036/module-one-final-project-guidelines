class Artist < ActiveRecord::Base

    has_many :collaborations
    has_many :exhibitions
    has_many :exhibitions, through: :collaborations
    has_many :curators, through: :exhibitions
    has_many :bookings, through: :exhibitions
    has_many :users, through: :bookings


    def self.search_credentials(username, password)
        if self.find_by(username: username, password: password)
            true
        else
            false
        end
    end

    def self.get_artist(username, password)
        self.find_by(username: username, password: password)
    end

    def view_collaborations
        Collaboration.where("artist_id == ?", self.id)
    end


    def create_exhibition(name, date, location, time)
        Exhibition.create(name: name, date: date, location: location, time: time, curator_id: nil, artist_id: self.id, style:self.style)
    end

    def make_exhibition_booking(exhibition)

        booking = Booking.create(artist_id: self.id, exhibition_id: exhibition.id, reference_number:SecureRandom.hex(6))

        puts "Booking complete. Reference number - #{booking.reference_number}."
    end


    def view_bookings
        Booking.all.where("artist_id == ?", self.id)
    end

    #methods for searching and retrieving info for the artist's own exhibitions
    def get_exhibitions
        Exhibition.all.where("artist_id = ?", self.id)
    end

    def get_previous_exhibitions
        get_exhibitions.select{|e| Date.parse(e.date) < Date.today}
    end

    def get_upcoming_exhibitions
        get_exhibitions.select{|e| Date.parse(e.date) > Date.today}
    end

    def view_exhibition_visitors(exhibition)
        Booking.all.where("exhibition_id == ?", exhibition.id).map{|x| x.visitor}
    end

    def exhibition_visitor_count(exhibition)
        self.view_exhibition_visitors(exhibition).length
    end


    # class methods
    
    def self.search_by_style(style)
        self.all.where("style == ?", style)
    end


    def self.search_by_name(name)
        self.all.where("name == ?", name)
    end

    def self.search_by_location(location)
        self.all.where("location == ?", location)
    end
    

    






end