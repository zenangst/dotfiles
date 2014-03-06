# Start Postgres Server
function postgres_start
  /usr/local/bin/pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
end