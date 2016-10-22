# Seeding seeding seeding, where are all the plants?

Song.delete_all
Photo.delete_all
Artist.delete_all

photo_sleaford_mods = Photo.create( remote_image_url: "http://res.cloudinary.com/dfllhddsg/image/upload/c_scale,h_50,r_0,w_50/v1477134869/Sleaford-Mods-014_bp6ze8.jpg" )
photo_rev_peyt      = Photo.create( remote_image_url: "http://res.cloudinary.com/dfllhddsg/image/upload/c_scale,h_50,r_0,w_50/v1477134855/big-damn-band_zcdhzo.jpg" )
photo_allah_las     = Photo.create( remote_image_url: "http://res.cloudinary.com/dfllhddsg/image/upload/c_scale,h_50,r_0,w_50/v1477134863/Allah-LasHighres2_eojnoo.jpg" )

sleaford_mods = Artist.create( { name: "Sleaford Mods", photo: photo_sleaford_mods } )
rev_peyt      = Artist.create( { name: "The Reverend Peyton's Big Damn Band", photo: photo_rev_peyt } )
allah_las     = Artist.create( { name: "Allah-Las", photo: photo_allah_las } )

Song.create( { name: "Tied Up In Nottz", artist: sleaford_mods} )
Song.create( { name: "Air Conditioning", artist: sleaford_mods} )

Song.create( { name: "Sure Feels Like Rain", artist: rev_peyt} )
Song.create( { name: "Everything's Raising", artist: rev_peyt} )

Song.create( { name: "Catamaran", artist: allah_las} )
Song.create( { name: "Don't You Forget It", artist: allah_las} )
