require 'rails_helper'

RSpec.describe ArtistsController, type: :controller do

  describe "GET #index" do
    it "should return http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  # TODO Check why this fails? We have routes in place?
  # describe "GET #show" do
    # artist = Artist.new(name: 'Bla')
    # it "should return http success" do
      # get :show, id: artist.id
      # expect(response).to have_http_status(:success)
    # end
  # end

end
