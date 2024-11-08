#!/bin/bash

# Start ssh
service ssh start

# Check if we should quote the exec params
UNQUOTE=false
if [ "$1" = "--unquote-exec" ]; then
  UNQUOTE=true
  shift
elif [ -n "${UNQUOTE_EXEC}" ] && [[ "${UNQUOTE_EXEC}" =~ ^(true|yes|y)$ ]]; then
  UNQUOTE=true
fi

# Run whatever the user wants.
if [ "${UNQUOTE}" = "true" ]; then
  exec $@
else
  exec "$@"
fi
