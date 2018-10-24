class Exhibition <  ActiveRecord::Base

    belongs_to :curator
    belongs_to :artist
    has_many :bookings
    has_many :users, through: :bookings
    has_many :artists, through: :collaborations
    


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