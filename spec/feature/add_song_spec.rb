require 'rails_helper'
require 'capybara'

feature "Add song", js: true do

  scenario 'once' do
    Capybara.current_driver = Capybara.javascript_driver
    artist = Artist.new(name: "Bla", photo: Photo.new(image: "bla"))
    artist.save
    visit artist_path(artist.id)

    # fill in the form
    fill_in 'song_name', with: 'A very nice song name'

    execute_script("$('form').submit()")
    sleep(1)
    expect(artist.songs.length).to eq(1)
  end

  scenario 'twice' do
    Capybara.current_driver = Capybara.javascript_driver
    artist = Artist.new(name: "Bla", photo: Photo.new(image: "bla"))
    artist.save
    visit artist_path(artist.id)

    # fill in the form
    fill_in 'song_name', with: 'A very nice song name'
    execute_script("$('form').submit()")

    # fill in the form again
    fill_in 'song_name', with: 'Another nice song name'

    execute_script("$('form').submit()")
    sleep(1)
    expect(artist.songs.length).to eq(2)
  end

end
