#!/bin/bash
set -e

# Remove a pre-existing server process for Rails
rm -f /ventures-be/tmp/pids/server.pid

# Execute the main process (CMD)
exec "$@"