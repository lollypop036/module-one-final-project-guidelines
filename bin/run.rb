require_relative '../config/environment'

#  ui = Interface.new
# ui.run
user = User.all[0]
# cd = UserEditMenu.new(User)
# cd = CuratorDashboard.new(curator)

# cd.run
# cv = CuratorViewExhibitions.new(curator)
# cv.run

ce = CuratorCreateMenu.new(curator)
ce.run


# ruby bin/run.rb

#puts "HELLO WORLD"
