class Collaboration < ActiveRecord::Base

    belongs_to :artist
    belongs_to :exhibition




    def self.search_exhibitions_by_artist(artist)
    self.all.where("artist_id == ?", artist.id).uniq.map{|x| x.exhibition}
    end


    def collaborators_names
        self.all.map{|x| x.artist_id.name}.split(" ")
    end


    def self.find_by_artist_name(name)
        Self.all.where("artist_id == ?", name.id)

    end
end