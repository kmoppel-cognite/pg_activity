-- Get active connections from pg_stat_activity prior to 9.2
-- Back then, there was no state column
SELECT COUNT(*) as active_connections
  FROM pg_stat_activity
 WHERE current_query NOT LIKE '<IDLE>%%'
 AND CASE WHEN %(dbname_filter)s IS NULL THEN true
    ELSE datname ~* %(dbname_filter)s
    END;
