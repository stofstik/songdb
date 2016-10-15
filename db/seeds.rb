# Seeding seeding seeding, where are all the plants?

Song.delete_all
Artist.delete_all

sleaford_mods = Artist.create( { name: "Sleaford Mods" } )
rev_peyt = Artist.create( { name: "The Reverend Peyton's Big Damn Band" } )
allah_las = Artist.create( { name: "Allah-Las" } )

Song.create( { name: "Tied Up In Nottz", artist: sleaford_mods} )
Song.create( { name: "Air Conditioning", artist: sleaford_mods} )

Song.create( { name: "Sure Feels Like Rain", artist: rev_peyt} )
Song.create( { name: "Everything's Raising", artist: rev_peyt} )

Song.create( { name: "Catamaran", artist: allah_las} )
Song.create( { name: "Don't You Forget It", artist: allah_las} )
