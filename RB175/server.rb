require "socket"

server = TCPServer.new("localhist", 3003)
loop do
  client = server.accept
  
  request_line = client.gets
  puts request_line
  
  client.puts request_line
  client.close
end