class MessagesController < ApplicationController
    include Plivo
    API = RestClient.new(PLIVO_ID, PLIVO_TOKEN)

    def index
        render json: "Hello from SMSsenger!"
    end

    # def create
    #     binding.pry
    #     I can set the URL in the send_sms action to hit this endpoint and create a message
    # end

    def send_sms
        response = API.messages.create(
            '16282683456',
            %w[12106729886],
            'Send test 2!'
          )
        puts response.message_uuid
    end

    def receive_sms
        from_number = params[:From]
        to_number = params[:To]
        text = params[:Text]
        puts "Message received - From: #{from_number}, To: #{to_number}, Text: #{text}"
    end
end
