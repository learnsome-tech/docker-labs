#!/bin/sh
set -eu
base="$BASE_URL"

echo "health endpoint answers"
wget -qO- "$base/health" | grep -q '"status": "ok"'

echo "a posted task is listed"
wget -qO- --post-data '{"title": "from the test"}' "$base/tasks" >/dev/null
wget -qO- "$base/tasks" | grep -q "from the test"

echo "database holds exactly the seed rows"
rows=$(psql -h db -U tasks -tAc "select count(*) from tasks")
test "$rows" -eq 2

echo "all checks passed"
