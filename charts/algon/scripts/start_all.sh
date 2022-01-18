#!/bin/sh
set -e

# # mkdir /algorand/node/data
# cp -r /root/node/* /algorand/node/   #data/

# # Start algod
# cp /root/node/genesisfiles/${ALGORAND_NETWORK}/genesis.json ${ALGORAND_DATA}genesis.json
# # /algorand/node/algod -l 0.0.0.0:8080 -d ${ALGORAND_DATA} &
# /algorand/node/goal node start -d ${ALGORAND_DATA} &

# sleep 5
# # Fast catchup
# # /algorand/node/goal node catchup `curl https://algorand-catchpoints.s3.us-east-2.amazonaws.com/channel/${ALGORAND_NETWORK}/latest.catchpoint` -d ${ALGORAND_DATA}

# # Write node status to stdout
# while true; do
#     /algorand/node/goal node status
#     sleep 3
# done &

# # Write node.log to stdout
# tail -f ${ALGORAND_DATA}node.log

cd /root/node/
/root/node/update.sh -i -c stable -p /algorand/node -d /algorand/node/data -n
# Start algod
cp /algorand/node/genesisfiles/${ALGORAND_NETWORK}/genesis.json ${ALGORAND_DATA}
# /algorand/node/algod -l 0.0.0.0:8080 &
/algorand/node/algod -l 0.0.0.0:8080 &
# sleep 2
# Fast catchup
/algorand/node/goal node catchup `curl https://algorand-catchpoints.s3.us-east-2.amazonaws.com/channel/${ALGORAND_NETWORK}/latest.catchpoint`

# Write node status to stdout
while true; do
    /algorand/node/goal node status
    sleep 5
done &

# Write node.log to stdout
tail -f ${ALGORAND_DATA}/node.log