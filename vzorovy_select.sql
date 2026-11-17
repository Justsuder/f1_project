
WITH team_race_stats AS (
    SELECT 
        t.team_id,
        count(rr.result_id) AS total_starts,
        sum(CASE WHEN rr.is_classified = false THEN 1 ELSE 0 END) AS total_dnfs,
        sum(
            CASE
                WHEN rr.finishing_position = 1 THEN 25
                WHEN rr.finishing_position = 2 THEN 18
                WHEN rr.finishing_position = 3 THEN 15
                WHEN rr.finishing_position = 4 THEN 12
                WHEN rr.finishing_position = 5 THEN 10
                WHEN rr.finishing_position = 6 THEN 8
                WHEN rr.finishing_position = 7 THEN 6
                WHEN rr.finishing_position = 8 THEN 4
                WHEN rr.finishing_position = 9 THEN 2
                WHEN rr.finishing_position = 10 THEN 1
                ELSE 0
            END
        ) AS team_points
    FROM f1.teams AS t
    JOIN f1.drivers AS d ON t.team_id = d.team_id
    JOIN f1.race_results AS rr ON d.driver_id = rr.driver_id
    GROUP BY t.team_id
),
team_pit_stats AS (
    SELECT 
        d.team_id,
        min(ps.duration_seconds) AS fastest_pitstop_sec,
        avg(ps.duration_seconds) AS avg_pitstop_sec
    FROM f1.pit_stops ps
    JOIN f1.drivers d ON ps.driver_id = d.driver_id
    GROUP BY d.team_id
)
SELECT 
    t.name AS constructor_name,
    coalesce(trs.team_points, 0) AS total_points,
    trs.total_dnfs AS cars_retired,
    round((trs.total_dnfs::numeric / nullif(trs.total_starts, 0)) * 100, 1) AS failure_rate_pct,
    tps.fastest_pitstop_sec,
    round(tps.avg_pitstop_sec::numeric, 2) AS average_pitstop_sec
FROM f1.teams t
JOIN team_race_stats trs ON t.team_id = trs.team_id
LEFT JOIN team_pit_stats tps ON t.team_id = tps.team_id
ORDER BY total_points DESC, average_pitstop_sec ASC;

