class Exhibition <  ActiveRecord::Base

    belongs_to :curator
    belongs_to :style
    has_many :users
    has_many :artists, through: :collaborators
    has_many :bookings
end