-- Check that the tables were created
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN ('users', 'source', 'crawl_job')
ORDER BY table_name;

-- Check the relationship between users, sources and crawl jobs
SELECT
    cj.job_id,
    cj.state AS job_status,
    cj.kind AS job_type,
    s.name AS source_name,
    u.username AS created_by
FROM crawl_job AS cj
JOIN source AS s ON s.source_id = cj.source_id
JOIN users AS u ON u.usr_id = s.created_by;

-- Quick row count
SELECT 'users' AS table_name, COUNT(*) AS total FROM users
UNION ALL
SELECT 'source', COUNT(*) FROM source
UNION ALL
SELECT 'crawl_job', COUNT(*) FROM crawl_job;
