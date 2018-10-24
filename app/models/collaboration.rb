class Collaboration < ActiveRecord::Base

    belongs_to :artist
    belongs_to :exhibition




    def self.search_exhibitions_by_artist(artist)
    self.all.where("artist_id == ?", artist.id).uniq.map{|x| x.exhibition}
    end

end