WITH RECURSIVE all_paths AS (
    SELECT point1, point2, total_cost, ARRAY[point1, point2] AS tour, 1 AS level
    FROM data_TSP
    WHERE point1 = 'a'
UNION ALL
    SELECT data_TSP.point1, data_TSP.point2, all_paths.total_cost + data_TSP.total_cost,
           all_paths.tour || data_TSP.point2, all_paths.level + 1
    FROM data_TSP
    JOIN all_paths ON data_TSP.point1 = all_paths.tour[all_paths.level + 1]
    WHERE (level = 3 AND data_TSP.point2 = 'a') OR data_TSP.point2 <> ALL(all_paths.tour)
)

SELECT total_cost, tour
FROM all_paths
WHERE (total_cost = (
    SELECT MIN(total_cost)
    FROM all_paths
    WHERE level = 4
) or total_cost = (SELECT max(total_cost)
    FROM all_paths
    WHERE level = 4)) AND level = 4
ORDER BY total_cost, tour;
