#!/usr/bin/env sh
set -e

# sleep 360

ALGO_TOKEN=sh cat /algorand/node/data/algod.token

# start with networked Algorand node
/go/src/github.com/algorand/indexer/cmd/algorand-indexer/algorand-indexer daemon \
-P "host=$POSTGRES_HOST port=$POSTGRES_PORT user=$POSTGRES_USER password=$POSTGRES_PASSWORD dbname=$DATABASE_NAME sslmode=$SSL_MODE" \
--algod-net="$ALGORAND_HOST:$ALGORAND_PORT" --algod-token="$ALGO_TOKEN" \
--metrics-mode $METRICS_MODE



# # start with networked Algorand node
# /go/src/github.com/algorand/indexer/cmd/algorand-indexer/algorand-indexer daemon \
# -P "host=$POSTGRES_HOST port=$POSTGRES_PORT user=$POSTGRES_USER password=$POSTGRES_PASSWORD dbname=$DATABASE_NAME sslmode=$SSL_MODE" \
# --algod=/algorand/node/data \
# --metrics-mode $METRICS_MODE



# start with local data directory
# /go/src/github.com/algorand/indexer/cmd/algorand-indexer/algorand-indexer daemon \
# -P "host=$POSTGRES_HOST port=$POSTGRES_PORT user=$POSTGRES_USER password=$POSTGRES_PASSWORD dbname=$DATABASE_NAME sslmode=$SSL_MODE" \
# --algod=/algorand/node/data \
# --metrics-mode $METRICS_MODE



# echo "Importing test data."
# /go/src/github.com/algorand/indexer/cmd/algorand-indexer/algorand-indexer import \
#   -P "host=$POSTGRES_HOST port=$POSTGRES_PORT user=$POSTGRES_USER password=$POSTGRES_PASSWORD dbname=$DATABASE_NAME sslmode=$SSL_MODE"\
#   --genesis "/tmp/algod/genesis.json" \
#   /tmp/blocktars/*

# echo "Starting indexer in read-only mode."
# /go/src/github.com/algorand/indexer/cmd/algorand-indexer/algorand-indexer daemon \
#   --metrics-mode $METRICS_MODE \
#   -P "host=$POSTGRES_HOST port=$POSTGRES_PORT user=$POSTGRES_USER password=$POSTGRES_PASSWORD dbname=$DATABASE_NAME sslmode=$SSL_MODE"
