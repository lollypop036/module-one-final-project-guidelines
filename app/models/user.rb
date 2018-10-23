class User <  ActiveRecord::Base
    belongs_to :style
    has_many :bookings
    has_many :exhibitions, through: :bookings
end