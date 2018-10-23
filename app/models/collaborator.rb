class Collaborator < ActiveRecord::Base

    has_many :artists
    has_many :exhibitions
    has_many :styles, through: :artists
    has_many :curators, through: :exhibitions
    has_many :booking, through: :exhibitions
    has_many :users, through: :bookings

end