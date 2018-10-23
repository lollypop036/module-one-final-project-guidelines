class Style < ActiveRecord::Base

    has_many :artists
    has_many :curators
    has_many :collaborations, through: :artists
    has_many :exhibitions, through: :collaborations
    has_many :bookings, through: :exhibitions
    has_many :users, through: :bookings

end