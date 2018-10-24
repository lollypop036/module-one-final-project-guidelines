
#Styles
# s1 = Style.create(name: "Post-modern")
# s2 = Style.create(name: "Abstract")

#Artists
a1 = Artist.create(name: "Jenny", location: "London", username: "jenny", password: "admin", style:"style")
a2 = Artist.create(name: "Jimmy", location: "Tokyo", username: "jimmy", password: "admin", style:"style")
a3 = Artist.create(name: "Bella", location: "Milan", username: "bella", password: "admin", style:"style")

#Exhibitions
ex1 = Exhibition.create(name: "World Wonders", date: "01/12/2018", location: "Tokyo", time: "10:00 - 18:00", curator_id: 1)
ex2 = Exhibition.create(name: "Life", date: "01/12/2018", location: "London", time: "10:00 - 16:00", curator_id: 1)
ex3 = Exhibition.create(name: "Long days", date: "09/09/2018", location: "London", time: "13:00 - 18:00", curator_id: 2)
ex4 = Exhibition.create(name: "Darkness", date: "22/10/2018", location: "Paris", time: "19:00 - 21:00", curator_id: 2)

#Collaborations
co1 = Collaboration.create()
co1 = Collaboration.create()
co1 = Collaboration.create()

#Curator
cu1 = Curator.create(name: "Terry Crews", username: "terry", password: "admin", location: "L.A.")
cu1 = Curator.create(name: "Kenny G", username: "kenny", password: "admin", location: "L.A.")

#Users
u1 = User.create(username: "ninab123", name: "Nina Bradley", location: "London", password: "admin")
u1 = User.create(username: "sean_c", name: "Sean Carter", location: "London", password: "admin")
u1 = User.create(username: "joey182", name: "Joey Pesci", location: "Milan", password: "admin")
u1 = User.create(username: "Aanaxox", name: "Anna Lima", location: "Tokya", password: "admin")


#Collaborator.create()