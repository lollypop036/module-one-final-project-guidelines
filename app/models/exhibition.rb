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
    
end