-- Demo rows to check that the tables work together.
-- This password_hash is a placeholder only. Do not use it for real login.

INSERT INTO users (usr_id, username, email, password_hash, role)
VALUES ('usr_001', 'rehan_demo', 'rehan.demo@example.com',
        'demo_hash_replace_before_real_use', 'analyst')
ON CONFLICT (usr_id) DO NOTHING;

INSERT INTO source (source_id, name, source_type, onion_addr, auth_ref, created_by)
VALUES ('src_001', 'Test Forum', 'forum', NULL, 'AUTH-TEST-001', 'usr_001')
ON CONFLICT (source_id) DO NOTHING;

INSERT INTO crawl_job (job_id, intent_id, source_id, kind)
VALUES ('job_001', 'intent_001', 'src_001', 'scheduled')
ON CONFLICT (job_id) DO NOTHING;
