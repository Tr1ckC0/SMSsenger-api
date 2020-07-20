class MessagesController < ApplicationController
  include Plivo
  API = RestClient.new(PLIVO_ID, PLIVO_TOKEN)

  def index
    messages = Message.all
    render json: messages
  end

  def history
    start_time, end_time = params.values_at(:start, :end).map {|time| time.gsub("T", " ")}
    response = API.messages.list(message_time__gte: start_time, message_time__lte: end_time, limit: 10, offset:0)
    ids = response[:objects].map {|msg| msg.message_uuid}
    messages = ids.map {|id| Message.find_by(message_uuid: id)}.select {|msg| !!msg}

    render json: messages
  end

  def send_sms
    to, text = message_params(:To, :Text).values_at(:To, :Text)
    message = Message.new(to: to, text: text, from: "16282683456")

    if message.save
      response = API.messages.create(
       "16282683456",
        [to],
        text
      )
      
      message.update(message_uuid: response.message_uuid[0])
    end # can add a status callback later
  end

  def receive_sms
    from, to, msg_id, text = params.values_at(:From, :To, :MessageUUID, :Text) 
    message = Message.new(to: to, from: from, message_uuid: msg_id, text: text)
    if message.save
      ActionCable.server.broadcast 'session_channel', message
    end
  end

  private

  def message_params(*args)
    params.require(:message).permit(*args)
  end
end
