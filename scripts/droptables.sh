#!/usr/bin/env bash
# usage: ./droptables.sh <db_name> [db_password]

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  echo "Usage: $0 db_name [db_password]"
  exit 1
fi

DB="$1"
if [ "$#" -eq 2 ]; then
  PASS="$2"
else
  echo -n "Enter MySQL root password: "
  stty -echo
  read PASS
  stty echo
  echo
fi

SQLFILE="/tmp/drop_${DB}.sql"
echo "SET FOREIGN_KEY_CHECKS=0;" > "$SQLFILE"
mysqldump --add-drop-table --no-data -u root -p"$PASS" "$DB" \
  | grep '^DROP TABLE' >> "$SQLFILE"
echo "SET FOREIGN_KEY_CHECKS=1;" >> "$SQLFILE"

mysql -u root -p"$PASS" "$DB" < "$SQLFILE"
rm "$SQLFILE"
