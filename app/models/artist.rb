class Artist < ActiveRecord::Base

    has_many :collaborations
    has_many :styles
    has_many :exhibitions, through: :collaborations
    has_many :curators, through: :exhibitions
    has_many :bookings, through: :exhibitions
    has_many :users, through: :bookings


    def self.search_credentials(username, password)
        if self.find_by(username: username, password: password)
            self.find_by(username: username, password: password)
        else
            false
        end
    end



    def view_collaborations
        Collaboration.where("artist_id == ?", self.id)
    end

    def view_exhibitions
        User.get_exhibitions_by_collaborations(self)
    end



end