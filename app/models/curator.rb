class Curator <  ActiveRecord::Base
    has_many :exhibitions
    has_many :collaborations, through: :exhibitions
    has_many :artists, through: :collaborations
    has_many :bookings, through: :exhibitions
    has_many :users, through: :bookings
end