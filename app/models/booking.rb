class Booking <  ActiveRecord::Base
    belongs_to :user
    belongs_to :curator
    belongs_to :artist
    belongs_to :exhibition

end