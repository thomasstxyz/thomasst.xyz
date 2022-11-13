#!/bin/sh

echo "in entrypoint"
# ... do first-time setup ...

# ...then run the command, nginx or otherwise
exec "$@"
