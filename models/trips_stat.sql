SELECT
  COUNT(*) AS trips,
  COUNT(DISTINCT user_id) AS users,
  AVG(EXTRACT(EPOCH FROM (finished_at - started_at))) / 60.0 AS avg_duration_m,
  SUM(price) / 100 AS revenue_rub,
  100.0 * SUM(CASE WHEN price = 0 THEN 1 ELSE 0 END) / COUNT(*) AS free_trips_pct
FROM scooters_raw.trips