class WelcomeController < ApplicationController
    def index
        render json: "Welcome to SMSsenger API"
    end
end
