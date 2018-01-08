class Api::V1::PollsController < ApplicationController
    before_action :authenticate, except: [:index, :show]
    def index
        @polls = Poll.all
    end

    def show
        @poll = Poll.find(params[:id])
    end

    def create
    end

    def update
    end

    def destroy
    end
end