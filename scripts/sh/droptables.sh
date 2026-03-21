#!/usr/bin/env bash

# usage: ./droptables.sh <db_name> [db_user]

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 db_name [db_user]"
  exit 1
fi

DB="$1"
USER="${2:-root}"

SQLFILE="/tmp/drop_${DB}.sql"

echo "SET FOREIGN_KEY_CHECKS=0;" > "$SQLFILE"

mariadb-dump --no-defaults --add-drop-table --no-data \
  -u "$USER" -p "$DB" \
  | grep '^DROP TABLE' >> "$SQLFILE"

echo "SET FOREIGN_KEY_CHECKS=1;" >> "$SQLFILE"

mariadb --no-defaults -u "$USER" -p "$DB" < "$SQLFILE"

rm "$SQLFILE"
