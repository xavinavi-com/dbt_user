WITH users_month_year AS (
  SELECT
    date_trunc('month', created_at) AS month_year,
    COUNT(*) AS num_users
  FROM
    public.users
  GROUP BY
    month_year
)

SELECT
  EXTRACT(YEAR FROM month_year) AS year,
  EXTRACT(MONTH FROM month_year) AS month,
  SUM(num_users) AS num_users
FROM
  users_month_year
GROUP BY
  year,
  month
ORDER BY
  year,
  month;
