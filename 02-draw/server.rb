require 'em-websocket'

puts "draw Running !"

def list
  @list ||= []
end

EM.run {
  EM::WebSocket.run(:host => "0.0.0.0", :port => 8124) do |ws|

    ws.onopen {
      list << ws
      puts "Connection open"
    }

    ws.onclose {
      list.delete self
      puts "Connection closed"
    }

    ws.onmessage { |msg|
      list.each {|conn|
        conn.send(msg)
      }
    }

  end
}
