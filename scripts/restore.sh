#!/bin/bash

export PGPASSWORD=${POSTGRES_PASSWORD}

check_db_ready() {
  echo "Checking if the database is ready for restore..."
  until pg_isready -h localhost -U postgres; do
    echo "Waiting for PostgreSQL to be ready..."
    sleep 2
  done
}

db_exists() {
  psql -U kim -d sushi_kim -c '\q' 2>/dev/null
  return $?
}

create_db() {
  echo "Database not found, creating the database..."
  psql -U kim -d postgres -c "CREATE DATABASE sushi_kim;"
}

restore_backup() {
  echo "Restoring data from backup..."
  psql -U kim -d sushi_kim -f /docker-entrypoint-initdb.d/sushi_kim_backup.sql
}

# Əsas funksiya
main() {
  check_db_ready

  if db_exists; then
    restore_backup
  else
    create_db
    restore_backup
  fi
}

main
