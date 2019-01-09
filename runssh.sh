#!/bin/sh

# Run the SSH daemon, listen on port 12345
./dropbear -R -p 127.0.0.1:12345 -a -P /tmp/dropbear.pid

# copy the private key where it needs to go
mkdir -p $HOME/.ssh
cat mykey.pub >> $HOME/.ssh/authorized_keys

# Open a tunnel to the remote VM, do remote port forwarding to here
nohup ssh -i mykey -N -f -R10234:localhost:12345 lior@35.204.64.171 &

