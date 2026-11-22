#!/bin/sh
# Start the refresher that keeps the spaces tree and the attention queue current.
#
# Herdr startup hooks are one-shot, not supervised daemons, so the loop has
# to be detached. It stops itself when the server's socket disappears, and the
# pidfile stops a second server start from stacking another loop on top.
set -e

HV="$(cd "$(dirname "$0")" && pwd)/hv"
STATE="${XDG_CACHE_HOME:-$HOME/.cache}/herdr-views"
PIDFILE="$STATE/annotate.pid"

mkdir -p "$STATE"

# Only a pid that is still our loop counts: after a reboot macOS may have
# handed the old pid to some other process.
pid="$(cat "$PIDFILE" 2>/dev/null || true)"
if [ -n "$pid" ] && ps -o command= -p "$pid" 2>/dev/null | grep -q "hv _annotate_loop"; then
    exit 0
fi

nohup "$HV" _annotate_loop >"$STATE/annotate.log" 2>&1 &
echo $! >"$PIDFILE"
