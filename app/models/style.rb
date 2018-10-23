class Style < ActiveRecord::Base

    has_many :artists
    has_many :curators
    has_many :collaborators, through: :artists
    has_many :exhibitions, through: :collaborators
    has_many :bookings, through: :exhibitions
    has_many :users, through: :bookings

end