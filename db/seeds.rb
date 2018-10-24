
#Styles
s1 = Style.create(name: "Post-modern")
s2 = Style.create(name: "Abstract")

#Artists
a1 = Artist.create(name: "Jenny", location: "London", style_id: 1, username: "jenny", password: "admin")
a2 = Artist.create(name: "Jimmy", location: "Tokyo", style_id: 1, username: "jimmy", password: "admin")
a3 = Artist.create(name: "Bella", location: "Milan", style_id: 2, username: "bella", password: "admin")

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
cu1 = Curator.create(name: "Terry Crews", username: "terry", password: "admin")
cu1 = Curator.create(name: "Kenny G", username: "kenny", password: "admin")

#Users
u1 = User.create(username: "ninab123", first_name: "Nina", last_name: "Bradley", location: "London", password: "admin")
u1 = User.create(username: "sean_c", first_name: "Sean", last_name: "Carter", location: "London", password: "admin")
u1 = User.create(username: "joey182", first_name: "Joey", last_name: "Pesci", location: "Milan", password: "admin")
u1 = User.create(username: "Aanaxox", first_name: "Anna", last_name: "Lima", location: "Tokya", password: "admin")


#Collaborator.create()