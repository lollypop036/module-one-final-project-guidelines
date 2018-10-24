class Exhibition <  ActiveRecord::Base

    belongs_to :curator
    belongs_to :artist
    has_many :bookings
    has_many :users, through: :bookings
    has_many :artists, through: :collaborations
    
end