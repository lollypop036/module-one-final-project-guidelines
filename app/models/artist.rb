class Artist < ActiveRecord::Base

    has_many :collaborators
    has_many :styles
    has_many :exhibitions, through: :collaborators
    has_many :curators, through: :exhibitions
    has_many :users, through: :exhibitions

end