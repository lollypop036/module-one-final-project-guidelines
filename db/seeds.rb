
#Styles
s1 = Style.create(name: "Post-modern")
s2 = Style.create(name: "Abstract")

#Artists
a1 = Artist.create(name: "Jenny", location: "London", style_id: 1)
a2 = Artist.create(name: "Jimmy", location: "Tokyo", style_id: 1)
a3 = Artist.create(name: "Bella", location: "Milan", style_id: 2)

#Exhibitions
ex1 = Exhibition.create(name: "World Wonders", location: "Tokyo")

#Collaborations
co1 = Collaboration.create()

#Curator
cu1 = Curator.create()

#Users
u1 = User.create()


#Collaborator.create()