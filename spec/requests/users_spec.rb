require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    # before do
    #   post '/signin', params: { username: 'user1', password: 'password' }
    # end

    it 'sign' do
      post '/signin', params: { username: 'user1', password: 'password' }
      puts response.body
      expect(response).to include 'user1'
    end
    # it "works! (now write some real specs)" do
    #   get "/users"
    #   expect(response).to render_template(:index)
    # end
  end
end
