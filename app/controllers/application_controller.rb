class ApplicationController < ActionController::API
    PLIVO_ID = ENV['AUTH_ID']
    PLIVO_TOKEN = ENV['AUTH_TOKEN']
    PLIVO_NUMBER = ENV['PHONE_NUMBER']
end
