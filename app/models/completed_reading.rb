class CompletedReading < ApplicationRecord
  PLAN_STREAK_SQL = <<-SQL
    SELECT (CURRENT_DATE - series_date::date) AS days
    FROM generate_series(
          ( SELECT created_at::date FROM completed_readings
            WHERE completed_readings.plan_id = :plan_id
            ORDER BY created_at ASC
            LIMIT 1
          ),
          CURRENT_DATE,
          '1 day'
        ) AS series_date
    LEFT OUTER JOIN completed_readings ON completed_readings.plan_id = :plan_id AND
                             completed_readings.created_at::date = series_date
    GROUP BY series_date
    HAVING COUNT(completed_readings.id) = 0
    ORDER BY series_date DESC
    LIMIT 1
  SQL

  default_scope { order(created_at: :asc) }

  def last_passage
    passages.split(',').last
  end

  def self.plan_reading_streak(plan_id)
    sql = sanitize_sql [ PLAN_STREAK_SQL, { plan_id: plan_id } ]
    result_value = connection.select_value(sql)
    Integer(result_value) rescue nil
  end
end
