class MessagesController < ApplicationController
    include Plivo
    CLIENT = RestClient.new(PLIVO_ID, PLIVO_TOKEN)

    def index
        render json: "Hello from SMSsenger!"
    end

    def send
        message_created = CLIENT.messages.create(
            '16282683456',
            %w[12106729886],
            'Hello from Rails!'
          )
    end

    def receive

    end
end
