class Exhibition <  ActiveRecord::Base

    belongs_to :curator
    belongs_to :artist
    has_many :bookings
    has_many :users, through: :bookings
    has_many :artists, through: :collaborations

    def self.view_previous_exhibitions(today_date)
        self.all.select{|e| Date.parse(e.date) < today_date}
    end

    def self.view_upcoming_exhibitions(today_date)
        self.all.select{|e| Date.parse(e.date) >= today_date}
    end

    def self.search_by_name(name)
        self.all.where("name = ?", name)
    end

    def self.search_by_style(style)
        self.all.where("style = ?", style)
    end

    def self.search_by_location(location)
        self.all.where("location = ?", location)
    end

    def self.search_by_date(date)
        self.all.where("date = ?", date)
    end}
    
    def view_attendees
        Booking.all.where("exhibition_id == ?", self.id).each{|x| if x.user != nil puts "#{x.user.name}" elsif x.curator !=nil puts "#{x.curator}" else puts "#{x.artist.name}"
    end

        def self.search_by_location(location)
            self.all.where("location == ?", location)
        end

        def self.search_by_date(date)
            self.all.where("date == ?", date)
        end

        def self.search_by_style(style)
            self.all.where("style == ?", style)
        end


        def self.search_by_artist(artist)
            self.all.where("artist_id == ?", artist.id)
        end







end