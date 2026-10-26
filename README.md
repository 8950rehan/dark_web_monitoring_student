# Dark Web Monitoring Database

Hi, this is my database task for the Dark Web Monitoring and Threat Intelligence project.

I created three PostgreSQL tables to store users, monitored sources, and crawl jobs. I also added a few sample records and a query to check that the tables are connected correctly.

## What I used

- PostgreSQL
- SQL
- Railway (for hosting the database)

## Tables

### 1. `users`
Stores the username, email, password hash, role, MFA status, and account status.

### 2. `source`
Stores details about a source that is approved for monitoring. The `auth_ref` field is required so there is a reference for authorization.

### 3. `crawl_job`
Stores each crawl attempt, including its type, status, attempt count, and stats.

## How the tables are connected

`users` → `source` → `crawl_job`

- `source.created_by` refers to `users.usr_id`
- `crawl_job.source_id` refers to `source.source_id`

## Run it

1. Create a PostgreSQL database.
2. Run `sql/schema.sql`.
3. Run `sql/sample_data.sql` to add demo rows.
4. Run `sql/check_data.sql` to test the relationships.

Example using `psql`:

```bash
psql "YOUR_DATABASE_URL" -v ON_ERROR_STOP=1 -f sql/schema.sql
psql "YOUR_DATABASE_URL" -v ON_ERROR_STOP=1 -f sql/sample_data.sql
psql "YOUR_DATABASE_URL" -v ON_ERROR_STOP=1 -f sql/check_data.sql
```

Replace `YOUR_DATABASE_URL` with your own connection URL. Do not put a real database URL or password in this repository.

## Railway hosting

1. Sign in at [Railway](https://railway.app/).
2. Create a project and add a PostgreSQL database.
3. Copy the database connection URL from the Railway database settings.
4. Run the commands above using that URL.

The SQL files are ready, but the database is only hosted after I create the Railway service and run the scripts.

## Testing

The final query in `sql/check_data.sql` joins all three tables. After inserting the sample rows, it should return the demo crawl job, its source name, and the username that registered the source.

## Note

The sample password value is only a placeholder, not a real password hash. This is a database-schema task; it does not include a login page or a crawler.
