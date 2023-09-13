#!/bin/bash

echo "exporting spark home"
export SPARK_HOME="/mount/data/analytics/spark-2.4.4-bin-hadoop2.7"
echo "activating venv"
source /mount/venv/bin/activate
echo "submitting the job"
spark-submit /mount/data/analytics/scripts/flink_audit/new-flink-audit.py "/mount/data/analytics/scripts/flink_audit/client_secrete.json" > auditLog.txt 2>&1
echo "deactivating venv"
deactivate
