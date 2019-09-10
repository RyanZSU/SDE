cd C:\Users\two\Documents\Ryan\Applications\bin
echo %DATE% %TIME% Start tunnling >> tunnel_forward.log

:while

echo %DATE% %TIME% Connecting to the server >> tunnel_forward.log
ssh -i C:\Users\two\Documents\Ryan\Applications\Data\ryan_id_rsa -o ServerAliveCountMax=5 -o ServerAliveInterval=60 -R 2222:192.168.10.149:22 ryan@52.230.4.1
echo %DATE% %TIME% Reconnect to the server >> tunnel_forward.log

goto :while