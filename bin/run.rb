require_relative '../config/environment'


#  ui = Interface.new
# ui.run
user = User.all[0]
ui = UserBookingMenu.new(user, Exhibition.all)
ui.run
# ui = UserEditMenu.new(user)
# ui.run
# ui = UserExhibitionSearchMenu.new(user)
# ui.run
# cd = UserEditMenu.new(User)

#ui = Interface.new
#ui.run
# curator = Curator.all[0]

# cd = CuratorDashboard.new(curator)

# cd.run
# cv = CuratorViewExhibitions.new(curator)
# cv.run

# ce = CuratorCreateMenu.new(curator)
# ce.run



# ruby bin/run.rb

#puts "HELLO WORLD"
