class MessagesController < ApplicationController
  include Plivo
  API = RestClient.new(PLIVO_ID, PLIVO_TOKEN)

  def index
    render json: "Hello from SMSsenger!"
  end

  def send_sms
    dst, text = message_params.values_at(:To, :Text)
    response = API.messages.create(
      "16282683456",
      [dst],
      text
    )
    puts response.message_uuid
  end

  def receive_sms
    message = Message.new(message_params)
    from_number = params[:From]
    to_number = params[:To]
    text = params[:Text]
    puts "Message received - From: #{from_number}, To: #{to_number}, Text: #{text}"
  end

  private

  def message_params
    params.require(:message).permit(:To, :Text)
  end
end
