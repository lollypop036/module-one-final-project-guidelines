class Booking <  ActiveRecord::Base
    belongs_to :user
    belongs_to :curator
    belongs_to :artist
    belongs_to :exhibition

    def self.search_by_user_id(id)
        Booking.where("user_id = ?", id)
    end

    def self.search_by_artist_id(id)
        Booking.where("artist_id = ?", id)
    end

    def self.search_by_curator_id(id)
        Booking.where("curator_id = ?", id)
    end

end