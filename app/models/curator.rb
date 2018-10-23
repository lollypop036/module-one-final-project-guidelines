class Curator <  ActiveRecord::Base
    has_many :exhibitions
    has_many :collaborators, through: :exhibitions
    has_many :artists, through: :collaborators
    has_many :users, through: :exhibitions
end