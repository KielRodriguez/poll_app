require 'rails_helper'

RSpec.describe Api::V1::PollsController, type: :request do
    before :each do
        create_list(:poll, 10)
        get "/api/v1/polls"
    end
    describe "GET /polls" do
        it { have_http_status(200) }
        it "mande la lista de encustas" do
            json = JSON.parse( response.body )
            expect(json.length).to eq(Poll.count)
        end
    end

    describe "GET /polls/:id" do
        before :each do
            @poll = create(:poll)
            get "/api/v1/polls/#{@poll.id}"
        end

        it { have_http_status(200) }
        
        it "manda la encuesta solicitada" do
            json = JSON.parse(response.body)
            expect(json["id"]).to eq(@poll.id )
        end

        it "manda los atributos de la encuesta" do
            json = JSON.parse(response.body)
            expect(json.keys).to contain_exactly("id", "title", "description", "expires_at", "user_id")
        end
    end
end