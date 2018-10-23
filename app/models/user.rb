class User <  ActiveRecord::Base
    belongs_to :style
    has_many :bookings
    has_many :exhibitions, through: :bookings
    

    def search_for_exhibitions_by_style(style)
        Exhibition.all.where("style.id == ?", style.name)
    end

    def search_for_collaborations_by_artist(artist)
        Collaboration.all.where("artist_id == ?", artist.id)
    end

    def view_exhibitions_by_collaborations(artist)
        ex_id = search_for_collaborations_by_artist(artist).map{|x| x.exhibition_id}.uniq
        Exhibition.all.where{|x| ex_id.include? x.id}.map{|y| y.name}
    end
  
    def make_exhibition_booking(exhibition)
        Booking.create(self.id, exhibition.id, SecureRandom.hex(6))
    end

    def view_bookings
        Booking.all.where("x.id == ?", self.id)
    end

    def self.search_credentials(username, password)
        if self.find_by(username: username, password: password)
            #self.find_by(username: username, password: password)
            true
        else
            false
        end
    end


end