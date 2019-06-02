class LinebotController < ApplicationController
  protect_from_forgery :except => [:callback]
  def callback

    body = request.body.read
    
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end

    events = client.parse_events_from(body)


    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type

        when Line::Bot::Event::MessageType::Text
          log = Log.new(user_id: event.message['id'], text: event.message['text'])
          log.save
          if event.message['text'] == "一覧"

            messages = Problem.all.order("id")
            reply=""
            messages.each do |m|
              reply += m.id.to_s + " " + m.title  + "\n"
            end
            reply += "見たい番号を半角数字で教えてね。"
            message = {
              type: 'text',
              text: reply
            }
            response = client.reply_message(event['replyToken'], message)
            
          elsif
            reply = Problem.find_by(id: event.message['text'])
            puts reply
            if reply
              message = {
                type: 'text',
                text: reply.answer
              }
              response = client.reply_message(event['replyToken'], message)
            else
              message = {
                type: 'text',
                text: event.message['text'] + "は見つからないよ"
              }
              response = client.reply_message(event['replyToken'], message)
            end
            
          end
        end
      end
    }
    head :ok
  end

  private
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
end

