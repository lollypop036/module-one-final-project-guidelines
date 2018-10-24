class Artist < ActiveRecord::Base

    has_many :collaborations
    has_many :exhibitions
    has_many :exhibitions, through: :collaborations
    has_many :curators, through: :exhibitions
    has_many :bookings, through: :exhibitions
    has_many :users, through: :bookings


    def self.search_credentials(username, password)
        if self.find_by(username: username, password: password)
            #self.find_by(username: username, password: password)
            true
        else
            false
        end
    end

    def view_collaborations
        Collaboration.where("artist_id == ?", self.id)
    end

    def view_all_exhibitions
        Exhibition.all
    end

    def create_exhibition(name, date, location, time, style)
        Exhibition.create(name: name, date: date, location: location, time: time, curator_id: nil, artist_id: self.id, style:self.style)
    end


    def search_curators(name)
        Curator.all.where("curator.name == ?", name)
    end

    

    




    #methods for searching and retrieving info for the artist's own exhibitions
    def get_exhibitions
        Exhibition.all.where(artist_id == self || collaborations.artist_id == self)
    end

    def get_previous_exhibitions(today_date)
        get_exhibitions.select{|e| Date.parse(e.date) < today_date}
    end

    def get_upcoming_exhibitions(today_date)
        get_exhibitions.select{|e| Date.parse(e.date) > today_date}
    end

    def view_exhibition_visitors(exhibition)
        Booking.all.where("exhibition_id == ?", exhibition.id).map{|x| x.visitor}
    end

    def exhibition_visitor_count(exhibition)
        self.view_exhibition_visitors(exhibition).length
    end

    
    def self.search_by_style(style)
        self.all.where("self.style == ?", style)
    end


    def self.search_by_name(name)
        self.all.where("self.name == ?", name)
    end

    def self.search_by_location(location)
        self.all.where("self.location == ?", location)
    end
    

    






end