class User <  ActiveRecord::Base
    has_many :bookings
    has_many :exhibitions, through: :bookings
    has_many :collaborators, through: :exhibitions
    has_many :artists, through: :collaborators 
    has_many :styles, through: :artists
end