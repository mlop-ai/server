#!/bin/bash
REMOTE_HOST=nope
REMOTE_PASSWORD=nope
CLICKHOUSE_HOST=localhost
CLICKHOUSE_USER=default
CLICKHOUSE_PASSWORD=nope

TABLES=("mlop_files" "mlop_data" "mlop_logs" "mlop_metrics")
for table in "${TABLES[@]}"; do
    clickhouse-client --host $CLICKHOUSE_HOST --user $CLICKHOUSE_USER --password $CLICKHOUSE_PASSWORD --port 9001 --query="INSERT INTO default.$table SELECT * FROM remoteSecure('$REMOTE_HOST', default, $table, 'default', '$REMOTE_PASSWORD')"
done
