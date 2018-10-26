require_relative '../config/environment'


#  ui = Interface.new
# ui.run
# ui = AddCollaboration.new(Exhibition.all)
# ui.run
# ui = UserDashboard.new(Curator.all[0])
# ui.run
# user = Curator.all[0]
# vi = BookingMenu.new(user, Exhibition.all)

# vi.run
# ui = UserEditMenu.new(user)
# ui.run
# ui = UserExhibitionSearchMenu.new(user)
# ui.run
# cd = UserEditMenu.new(User)

#ui = Interface.new
#ui.run
# curator = Curator.all[0]

cd = ArtistDashboard.new(Artist.all[0])
cd.run


art = CuratorDashboard.new(artist)

# cd.run
# cv = CuratorViewExhibitions.new(curator)
# cv.run

# ce = CuratorCreateMenu.new(curator)
# ce.run



# ruby bin/run.rb

#puts "HELLO WORLD"
