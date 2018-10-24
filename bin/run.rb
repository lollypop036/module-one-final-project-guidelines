require_relative '../config/environment'


#  ui = Interface.new
# ui.run
user = User.all[0]
# ui = UserEditMenu.new(user)
# ui.run
ui = UserExhibitionSearchMenu.new(user)
ui.run
# cd = UserEditMenu.new(User)

#ui = Interface.new
#ui.run
# curator = Curator.all[0]

# cd = CuratorDashboard.new(curator)

# cd.run
# cv = CuratorViewExhibitions.new(curator)
# cv.run
artist = Artist.all[0]
art = ArtistDashboard.new(artist)
art.run

# ce = CuratorCreateMenu.new(curator)
# ce.run



# ruby bin/run.rb

#puts "HELLO WORLD"
