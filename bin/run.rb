require_relative '../config/environment'

# ui = Interface.new
# ui.run
curator = Curator.all[0]
# cd = CuratorDashboard.new(curator)
# cd.run
edit_menu = CuratorEditMenu.new(curator)
edit_menu.run

# ruby bin/run.rb

#puts "HELLO WORLD"
