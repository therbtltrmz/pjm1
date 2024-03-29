#!/usr/bin/lua51

-- Load the library
socket = require( "libhttpd" );

-- Start listening upon a socket
listener = socket.bind( 1310 );

-- Show instructions!
print( "Echo server running on port 1310" );

-- Loop waiting for connections
while true do

   -- Accept a new connection.
   client,ip = socket.accept( listener );

   -- Read from the client.
   length, data = socket.read(client);
   
   while( length > 0 ) do 
       -- Echo data back to client.
       socket.write( client, data );

       length, data = socket.read( client );
   end

   -- Now close the socket.
   socket.close( client );

end
