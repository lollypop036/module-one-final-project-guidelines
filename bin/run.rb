require_relative '../config/environment'

#  ui = Interface.new
# ui.run
curator = Curator.all[0]
# cd = CuratorDashboard.new(curator)
# cd.run
cv = CuratorViewExhibitions.new(curator)
cv.run

# ruby bin/run.rb

#puts "HELLO WORLD"
