require 'em-websocket'

puts "ping-pong Running !"

EM.run {
  EM::WebSocket.run(:host => "0.0.0.0", :port => 8124) do |ws|

    ws.onopen { puts "Connection open" }
    ws.onclose { puts "Connection closed" }

    ws.onmessage { |msg|
      if msg=="ping"
        ws.send "pong"
        puts "=> ping"
        puts "<= pong"
      end
    }

  end
}
