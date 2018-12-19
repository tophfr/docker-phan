#!/bin/sh
set -e

if [ ! -f ".phan/config.php" ]; then
  mkdir -p .phan
  cp /config.php .phan
fi

exec /usr/local/bin/phan "$@"
