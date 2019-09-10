cd C:\Users\two\Documents\Ryan\Applications\bin
echo %DATE% %TIME% Start tunnling >> tunnel.log

:while

echo %DATE% %TIME% Connecting to the server >> tunnel.log
ssh -i C:\Users\two\Documents\Ryan\Applications\Data\ryan_id_rsa -o ServerAliveCountMax=5 -o ServerAliveInterval=60 -R 5826:localhost:3389 ryan@52.230.4.1
echo %DATE% %TIME% Reconnect to the server >> tunnel.log

goto :while