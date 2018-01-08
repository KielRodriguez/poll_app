require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do
    describe "POST /users" do
        before :each do
            auth = { provider: 'facebook', uid: '12345678lkd', info: { email: 'nuevo@email.com' } }
            post "/api/v1/users", params: { auth: auth }
        end
        it { have_http_status(200) }
    

        it { change(User, :count).by(1) }

        it "should response with user found or created" do
            json = JSON.parse(response.body)
            expect(json["email"]).to eq("nuevo@email.com")
        end
    end
end 