#!/usr/bin/env bash

set -e -o pipefail

[[ -z "$DART_SITE_ENV_DEFS" ]] && . ./scripts/env-set.sh

PORT=${SITE_LOCALHOST_PORT:-5000}

set +e
SITE=$(grep '^destination:' _config.yml | awk '{ print $2}')
set -e
: ${SITE:-_site}

if [ ! -e "./$SITE" ]; then
  echo "INFO: $SITE directory not found. Site not built? Skipping link checks."
  exit 0
fi

if (set -x; superstatic --port $PORT > /dev/null 2>&1) then
  SERVER_PID=$!
  sleep 4
else
  echo "WARNING: Failed to launch superstatic server. I'll assume it is already running."
fi

# Don't check for external links yet since it seems to cause problems on Travis: --external
pub run linkcheck \
  --skip-file ./scripts/config/linkcheck-skip-list.txt \
  :$PORT \
  | tee $TMP/linkcheck-log.txt

set +x

if ! grep '^\s*0 errors' $TMP/linkcheck-log.txt | wc -l > /dev/null; then
  CHECK_EXIT_CODE=1
else
  CHECK_EXIT_CODE=0
fi

if [[ -n $SERVER_PID ]]; then kill $SERVER_PID; fi

exit $CHECK_EXIT_CODE
