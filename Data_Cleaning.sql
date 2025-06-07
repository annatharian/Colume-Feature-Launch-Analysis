SELECT COUNT(*) FROM activity_log;
SELECT COUNT(*) FROM billing;
SELECT COUNT(*) FROM features;
SELECT COUNT(*) FROM feedback;
SELECT COUNT(*) FROM sessions;
SELECT COUNT(*) FROM subscriptions;
SELECT COUNT(*) FROM support_tickets;
SELECT COUNT(*) FROM system_metrics;
SELECT COUNT(*) FROM users;

SELECT * FROM activity_log;

-- Count NULL values for each column in activity_log table

SELECT 
	SUM(CASE WHEN activity_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_id,
	SUM(CASE WHEN session_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_session,
	SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_user,
	SUM(CASE WHEN activity_type IS NULL THEN 1 ELSE 0 END) AS Nulls_in_type,
	SUM(CASE WHEN timestamp IS NULL THEN 1 ELSE 0 END) AS Nulls_in_ts
FROM activity_log;

-- Check for NULLS in billing table

SELECT * FROM billing;

SELECT
	SUM(CASE WHEN billing_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_id,
	SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_user,
	SUM(CASE WHEN billing_date IS NULL THEN 1 ELSE 0 END) AS Nulls_in_date,
	SUM(CASE WHEN plan_type IS NULL THEN 1 ELSE 0 END) AS Nulls_in_plan,
	SUM(CASE WHEN amount IS NULL THEN 1 ELSE 0 END) AS Nulls_in_amount,
	SUM(CASE WHEN currency IS NULL THEN 1 ELSE 0 END) AS Nulls_in_currency,
	SUM(CASE WHEN status IS NULL THEN 1 ELSE 0 END) AS Nulls_in_status,
	SUM(CASE WHEN payment_method IS NULL THEN 1 ELSE 0 END) AS Nulls_in_pm
FROM billing;

-- 23 NULLS in plan_type, 44 NULLS in currency

-- Check for NULLS in features table

SELECT * FROM features;

-- Check for NULLS in feedback table

SELECT * FROM feedback;

SELECT
	SUM(CASE WHEN feedback_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_id,
	SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_user,
	SUM(CASE WHEN session_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_session,
	SUM(CASE WHEN submission_timestamp IS NULL THEN 1 ELSE 0 END) AS Nulls_in_ts,
	SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS Nulls_in_rating,
	SUM(CASE WHEN comment_type IS NULL THEN 1 ELSE 0 END) AS Nulls_in_commenttype,
	SUM(CASE WHEN comment IS NULL THEN 1 ELSE 0 END) AS Nulls_in_comment,
	SUM(CASE WHEN feature_area IS NULL THEN 1 ELSE 0 END) AS Nulls_in_featureArea
FROM feedback;

-- 7 NULLS in rating, 48 in Comment Type and 1870 in features

-- Check for NULLS in sessions

SELECT * FROM sessions;

SELECT
	SUM(CASE WHEN session_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_id,
	SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_user,
	SUM(CASE WHEN login_time IS NULL THEN 1 ELSE 0 END) AS Nulls_in_login,
	SUM(CASE WHEN logout_time IS NULL THEN 1 ELSE 0 END) AS Nulls_in_logout,
	SUM(CASE WHEN device_type IS NULL THEN 1 ELSE 0 END) AS Nulls_in_devicetype
FROM sessions;

-- 11385 NULLS in Device Type

-- Check NULLS in subscription
SELECT * FROM subscriptions;

-- Count null values and calculate the percentage of nulls for specified columns in the subscriptions table
SELECT
    SUM(CASE WHEN subscription_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_id,
    CAST(SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS percent_in_user,
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_user,
    SUM(CASE WHEN [plan] IS NULL THEN 1 ELSE 0 END) AS Nulls_in_plan,
    CAST(SUM(CASE WHEN [plan] IS NULL THEN 1 ELSE 0 END) AS FLOAT) * 100.0 / COUNT(*) AS percent_in_plan,
    SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS Nulls_in_duration,
    SUM(CASE WHEN start_date IS NULL THEN 1 ELSE 0 END) AS Nulls_in_start_date,
    SUM(CASE WHEN end_date IS NULL THEN 1 ELSE 0 END) AS Nulls_in_endDate,
    SUM(CASE WHEN [status] IS NULL THEN 1 ELSE 0 END) AS Nulls_in_status
FROM subscriptions;

-- Check NULLS in support_tickets

SELECT * FROM support_tickets;

SELECT
    SUM(CASE WHEN ticket_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_id,
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS Nulls_in_user,
    SUM(CASE WHEN feature IS NULL THEN 1 ELSE 0 END) AS Nulls_in_feature,
    SUM(CASE WHEN submitted_at IS NULL THEN 1 ELSE 0 END) AS Nulls_in_submitted_at,
    SUM(CASE WHEN [priority] IS NULL THEN 1 ELSE 0 END) AS Nulls_in_priority,
    SUM(CASE WHEN resolved IS NULL THEN 1 ELSE 0 END) AS Nulls_in_resolved,
    SUM(CASE WHEN resolved_at IS NULL THEN 1 ELSE 0 END) AS Nulls_in_resolved_at,
    SUM(CASE WHEN [status] IS NULL THEN 1 ELSE 0 END) AS Nulls_in_status
FROM support_tickets;

-- 938 NULLS in resolved_at

-- Check NULLS in system_metrics

SELECT * FROM system_metrics;

SELECT
    SUM(CASE WHEN timestamp IS NULL THEN 1 ELSE 0 END) AS Nulls_timestamp,
    SUM(CASE WHEN active_users IS NULL THEN 1 ELSE 0 END) AS active_users, -- Alias could be more descriptive like Nulls_in_active_users
    SUM(CASE WHEN request_count IS NULL THEN 1 ELSE 0 END) AS Nulls_in_request_count,
    SUM(CASE WHEN error_count IS NULL THEN 1 ELSE 0 END) AS Nulls_in_error_count ,
    SUM(CASE WHEN error_rate IS NULL THEN 1 ELSE 0 END) AS Nulls_in_error_rate,
    SUM(CASE WHEN cpu_usage IS NULL THEN 1 ELSE 0 END) AS Nulls_in_cpu_usage,
    SUM(CASE WHEN memory_usage IS NULL THEN 1 ELSE 0 END) AS Nulls_in_memory_usage ,
    SUM(CASE WHEN response_time IS NULL THEN 1 ELSE 0 END) AS Nulls_in_response_time
FROM system_metrics;

-- No NULLS

-- Check NULLS in users

SELECT * FROM users;

SELECT
    SUM(CASE WHEN user_id IS NULL THEN 1 ELSE 0 END) AS Nulls_id,
    SUM(CASE WHEN full_name IS NULL THEN 1 ELSE 0 END) AS full_name, -- Alias could be more descriptive like Nulls_in_full_name
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS Nulls_in_email,
    SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS Nulls_in_location ,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS Nulls_in_age,
    SUM(CASE WHEN plan_type IS NULL THEN 1 ELSE 0 END) AS Nulls_in_plan_type,
    SUM(CASE WHEN sign_up_date IS NULL THEN 1 ELSE 0 END) AS Nulls_in_sign_up_date ,
    SUM(CASE WHEN is_active IS NULL THEN 1 ELSE 0 END) AS Nulls_in_is_active,
    SUM(CASE WHEN churn_date IS NULL THEN 1 ELSE 0 END) AS Nulls_in_churn_date,
    SUM(CASE WHEN last_login_date IS NULL THEN 1 ELSE 0 END) AS Nulls_in_last_login_date
FROM users;

-- 1988 NULL values in uer_id, 2016 in full_name, 2505 in email, 2530 in location, 2005 in plan_type, 1988 in sign_up_date, 1988 in is_active, 11431 in churn_date, 1988 in last_login_date

-- Count subscriptions per user, which can be an indicator of engagement or different service tiers
SELECT user_id, COUNT(*) FROM subscriptions
GROUP BY user_id;

-- DATA CLEANING AND PREPARATION

-- CHECKING THE PERCENTAGE OF NULLS IN EACH COLUMN FOR THE 'users' TABLE

-- Calculate total rows, count of non-null user_id, and percentage of null user_id

SELECT COUNT(*) AS all_rows, COUNT(user_id) AS user_cnt,
(COUNT(*) - COUNT(user_id)) * 100.0 /COUNT(*) AS percentage_of_null_user_id -- Added descriptive alias
FROM users;

-- Calculate percentage of nulls for selected columns in the 'users' table using UNION ALL
SELECT 'user_id' AS [columns],(COUNT(*) - COUNT(user_id)) * 100.0 /COUNT(*) AS percentage_of_nulls
FROM users
UNION ALL
SELECT 'Full_name' AS columns,(COUNT(*) - COUNT(Full_name)) * 100.0 /COUNT(*) AS percentage_of_nulls -- Corrected alias to 'columns' for consistency
FROM users
UNION ALL
SELECT 'Email' AS columns,(COUNT(*) - COUNT(Email)) * 100.0 /COUNT(*) AS percentage_of_nulls -- Corrected alias
FROM users
UNION ALL
SELECT 'location' AS columns, -- Corrected alias
CAST((COUNT(*) - COUNT(location)) * 100.0 /COUNT(*) AS DECIMAL(5,2)) AS percentage_of_nulls
FROM users;

-- CHECK FOR DUPLICATES VALUES IN 'users' TABLE

SELECT user_id, COUNT(*) AS cnt
FROM users
GROUP BY user_id
HAVING COUNT(*) >1;

-- REMOVE THE DUPLICATES FROM 'users' TABLE

WITH ranked_users AS (
    SELECT *, 
           ROW_NUMBER() OVER(
               PARTITION BY user_id, full_name, email, location, age, plan_type, sign_up_date, churn_date, last_login_date 
               ORDER BY sign_up_date
           ) AS rowNum
    FROM users
)
SELECT *
FROM ranked_users
WHERE rowNum=1 AND user_id IS NOT NULL;

-- Step 1: Create a temporary table with only unique rows
SELECT *
INTO #TempUsers  -- this creates a temporary table
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (
               PARTITION BY user_id, full_name, email, location, age, plan_type, sign_up_date, churn_date, last_login_date
               ORDER BY sign_up_date
           ) AS rowNum
    FROM users
) AS ranked
WHERE rowNum = 1;

-- Step 2: Delete everything from the original table
DELETE FROM users;

-- Step 3: Insert the unique records back into the original table
INSERT INTO users (
    user_id, full_name, email, location, age, plan_type, sign_up_date, is_active, churn_date, last_login_date
)
SELECT 
    user_id, full_name, email, location, age, plan_type, sign_up_date, is_active, churn_date, last_login_date
FROM #TempUsers;

DROP TABLE #TempUsers;

EXEC sp_help users;

-- CHECK FOR DUPLICATES IN 'sessions' TABLE AND REMOVE IT

SELECT * FROM sessions;

WITH ranked_sess AS (
    SELECT *, 
           ROW_NUMBER() OVER(
               PARTITION BY session_id, user_id, login_time, logout_time, device_type
               ORDER BY login_time
           ) AS rowNum
    FROM sessions
)
SELECT COUNT(*)
FROM ranked_sess
WHERE rowNum=1 AND session_id IS NOT NULL;

SELECT *
INTO #TempUsers  -- this creates a temporary table
FROM (
    SELECT *, 
           ROW_NUMBER() OVER (
               PARTITION BY user_id, login_time, logout_time, device_type
               ORDER BY login_time
           ) AS rowNum
    FROM sessions
) AS ranked
WHERE rowNum = 1;

DELETE FROM sessions;

SELECT * FROM sessions;

INSERT INTO sessions (
    session_id, user_id, login_time, logout_time, device_type
)
SELECT 
    session_id, user_id, login_time, logout_time, device_type
FROM #TempUsers;

DROP TABLE #TempUsers;

SELECT COUNT(*) FROM sessions;

SELECT * FROM sessions WHERE session_id = 'sess_09179662';


-- CHECK FOR DUPLICATE VALUES AND CLEAN 'sessions' TABLE

-- Step 1: Review existing data
SELECT * FROM sessions;

-- Step 2: Create intermediate deduplicated table based on full row
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY session_id, user_id, login_time, logout_time, device_type 
        ORDER BY login_time
    ) AS rowN
    FROM sessions
)
SELECT session_id, user_id, login_time, logout_time, device_type
INTO clean_sessions
FROM CTE
WHERE rowN = 1;

-- Step 3: Inspect specific session (optional)
SELECT * FROM sessions WHERE session_id = 'sess_09179662';

DROP TABLE sessions;

-- Step 4: Deduplicate further based on session_id only, keeping the earliest login
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY session_id 
        ORDER BY login_time ASC
    ) AS rowN
    FROM clean_sessions
)
SELECT session_id, user_id, login_time, logout_time, device_type
INTO sessions
FROM CTE
WHERE rowN = 1;

-- Step 5: Drop intermediate table
DROP TABLE clean_sessions;

-- Step 6: Validate that session_id is now unique
SELECT session_id, COUNT(*)
FROM sessions
GROUP BY session_id
HAVING COUNT(*) > 1;  -- Should return zero rows

-- CHECK FOR DUPLICATE VALUES AND CLEAN 'subscriptions' TABLE

-- Step 1: Review existing data
SELECT * FROM subscriptions;

-- Step 2: Check for duplicate subscription_ids in the 'subscriptions' table
SELECT subscription_id, COUNT(*) FROM subscriptions
GROUP BY subscription_id
HAVING COUNT(*) > 1;

-- CHECK FOR DUPLICATE VALUES AND CLEAN 'activity_log' TABLE
-- Retrieve all activity_log for inspection
SELECT * FROM activity_log;

-- Check for duplicate activity_ids in the 'activity_log' table
SELECT activity_id, COUNT(*) FROM activity_log
GROUP BY activity_id
HAVING COUNT(*) > 1;

-- CHECK FOR DUPLICATE VALUES AND CLEAN 'billing' TABLE
-- Retrieve all activity_log for inspection
SELECT * FROM billing;

-- Check for duplicate activity_ids in the 'activity_log' table
SELECT billing_id, COUNT(*) FROM billing
GROUP BY billing_id
HAVING COUNT(*) > 1;

-- CHECK FOR DUPLICATE VALUES AND CLEAN 'support_tickets' TABLE
SELECT * FROM support_tickets;

-- Check for duplicate activity_ids in the 'activity_log' table
SELECT ticket_id, COUNT(*) FROM support_tickets
GROUP BY ticket_id
HAVING COUNT(*) > 1;

-- CHECK FOR DUPLICATE VALUES AND CLEAN 'system_metrics' TABLE
SELECT * FROM system_metrics;

-- Check for duplicate activity_ids in the 'activity_log' table
SELECT timestamp, COUNT(*) FROM system_metrics
GROUP BY timestamp
HAVING COUNT(*) > 1;

-- SCHEMA INFORMATION AND MODIFICATIONS

-- CHECKING FOR DATA TYPES of columns in the 'users' table
SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'users';

-- Attempt to add a primary key constraint on user_id in the 'users' table
ALTER TABLE users
ADD CONSTRAINT pk_userid PRIMARY KEY (user_id);

-- Check for NULL user_ids in the 'users' table (the renamed Clean_users)
SELECT * FROM users WHERE user_id IS NULL;

-- Check for duplicate user_ids in the 'users' table
SELECT user_id, COUNT(*) FROM users
GROUP BY user_id
HAVING COUNT(*) > 1;

-- Ensure user_id is unique before making it a PK,
-- but it creates a new table 'check_user' with distinct user_ids, which isn't directly used to modify 'users'
SELECT DISTINCT user_id
INTO check_user
FROM users;

-- Step 1: Review existing data
SELECT * FROM users;

-- Step 2: Create intermediate deduplicated table based on full row
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY user_id, Full_name, Email, location, age, plan_type, sign_up_date, is_active, churn_date, last_login_date 
        ORDER BY (SELECT NULL)
    ) AS rowN
    FROM users
)
SELECT user_id, Full_name, Email, location, age, plan_type, sign_up_date, is_active, churn_date, last_login_date 
INTO clean_users
FROM CTE
WHERE rowN = 1;

SELECT * FROM clean_users;

-- Step 2: Deduplicate on user_id only and keep first occurrence
WITH CTE AS (
    SELECT *, ROW_NUMBER() OVER (
        PARTITION BY user_id
        ORDER BY (SELECT NULL)
    ) AS rowN
    FROM clean_users
)
SELECT user_id, Full_name, Email, location, age, plan_type, sign_up_date, is_active, churn_date, last_login_date 
INTO Clean_user
FROM CTE
WHERE rowN = 1;

SELECT user_id, COUNT(*) 
FROM Clean_user
GROUP BY user_id
HAVING COUNT(*)>1;

SELECT * FROM Clean_user;

DELETE FROM Clean_user WHERE user_id IS NULL;

ALTER TABLE users ADD CONSTRAINT pk_userid PRIMARY KEY (user_id);

DELETE FROM users;

INSERT INTO users (
    user_id, Full_name, Email, location, age, plan_type, sign_up_date, is_active, churn_date, last_login_date
)
SELECT 
    user_id, Full_name, Email, location, age, plan_type, sign_up_date, is_active, churn_date, last_login_date 
FROM Clean_user;

SELECT * FROM users;

SELECT user_id, COUNT(*) 
FROM users
GROUP BY user_id
HAVING COUNT(*)>1;

DROP TABLE clean_users;
DROP TABLE Clean_user;

SELECT * FROM users WHERE user_id IS NULL;

ALTER TABLE users
ALTER COLUMN user_id NVARCHAR(255) NOT NULL;

ALTER TABLE users
ADD CONSTRAINT pk_userid PRIMARY KEY (user_id);

UPDATE users SET full_name = RTRIM(LTRIM(full_name));

SELECT * FROM users;

UPDATE users SET age = NULL WHERE age < 16 OR age > 90;

SELECT *
FROM users
WHERE ISNUMERIC(age) = 0;

UPDATE users SET age = NULL WHERE TRY_CAST(age AS INT) IS NULL AND age IS NOT NULL;

-- CHECKING FOR INVALID DATE RANGES in 'users' table
-- Select records where churn_date is before sign_up_date (and they are not the same day)
SELECT * FROM users
WHERE churn_date < sign_up_date AND churn_date <> sign_up_date;

-- Update 'churn_date' to be equal to 'sign_up_date' where churn_date is incorrectly before sign_up_date
UPDATE users SET churn_date = sign_up_date
WHERE churn_date < sign_up_date AND churn_date <> sign_up_date;

-- CHECKING FOR INVALID CATEGORICAL VALUES

-- Show distinct status values in the 'subscriptions' table to identify inconsistencies
SELECT DISTINCT status FROM subscriptions;

-- Show distinct plan_type values in the 'users' table to identify inconsistencies
SELECT DISTINCT plan_type FROM users;

-- Standardize 'plan_type' values in the 'users' table
UPDATE users SET plan_type =
CASE
    WHEN plan_type = 'Basicc' THEN 'Basic'
    WHEN plan_type IN('Enterpris', 'Pro Plus','Bronze') THEN 'Enterprise' -- Consolidating multiple variations to 'Enterprise'
    ELSE plan_type -- Keep other values as they are
END

-- Inspect 'billing' table records where plan_type is 'Bronze' (perhaps before a cleanup or cross-check)
SELECT * FROM billing
WHERE plan_type = 'Bronze';

-- Standardize 'currency' values in the 'billing' table
UPDATE billing SET currency =  CASE WHEN currency = 'XYZ' THEN 'USD'
ELSE currency END;

-- Show distinct plan_type values in the 'users' table to identify inconsistencies
SELECT DISTINCT plan_type FROM billing;

UPDATE billing SET plan_type =
CASE
    WHEN plan_type = 'Basicc' THEN 'Basic'
    WHEN plan_type IN('Enterpris', 'Pro Plus','Bronze') THEN 'Enterprise' -- Consolidating multiple variations to 'Enterprise'
    ELSE plan_type -- Keep other values as they are
END

SELECT * FROM billing
WHERE plan_type = 'Bronze';

-- Join billing, subscriptions, and users tables to check data consistency for 'Pro Plus' plan
SELECT b.user_id, s.[plan], u.plan_type -- Using u.plan_type from users and s.[plan] from subscriptions
FROM billing b
JOIN subscriptions s ON s.user_id = b.user_id
JOIN users u ON u.user_id = b.user_id
WHERE u.plan_type = 'Pro Plus'; -- And plan_type = 'Pro Plus' in the original script was ambiguous, assumed users table

-- CHECKING FOR CROSS COLUMN LOGICAL VALIDATION AND CORRECTING AMOUNTS IN 'billing' TABLE

-- Standardize 'amount' in 'billing' based on 'plan_type' and 'currency' (NGN)
UPDATE billing SET amount =  CASE
    WHEN plan_type = 'Basic' AND currency = 'NGN' THEN 15000
    WHEN plan_type = 'Pro' AND currency = 'NGN' THEN 55500
    WHEN plan_type = 'Enterprise' AND currency = 'NGN' THEN  283500
    ELSE amount -- Keep other amounts as they are
END;

-- Standardize 'amount' in 'billing' based on 'plan_type' and 'currency' (USD)
UPDATE billing SET amount =  CASE
    WHEN plan_type = 'Basic' AND currency = 'USD' THEN 10
    WHEN plan_type = 'Pro' AND currency = 'USD' THEN 37
    WHEN plan_type = 'Enterprise' AND currency = 'USD' THEN  189
    ELSE amount
END;

-- This seems to be an attempt to correct plan_type based on amount and currency,
-- but the condition `plan_type = 'USD'` is likely an error, should be `currency = 'USD'`
UPDATE billing SET plan_type = CASE
    WHEN currency = 'USD' AND amount <= 10 THEN 'Basic' -- Corrected: currency = 'USD'
    WHEN currency = 'USD' AND amount = 37 THEN 'Pro'    -- Corrected: currency = 'USD'
    WHEN currency = 'USD' AND amount = 189 THEN  'Enterprise' -- Corrected: currency = 'USD'
    ELSE plan_type
END;

-- Inspect 'billing' for 'Enterprise' plan in 'GBP'
SELECT * from billing
WHERE plan_type = 'Enterprise' AND currency = 'GBP';

-- Standardize 'amount' in 'billing' based on 'plan_type' and 'currency' (GBP)
-- Note: 'GPB' typo for 'GBP' in the Enterprise condition
UPDATE billing SET amount =  CASE
    WHEN plan_type = 'Basic' AND currency = 'GBP' THEN 7.5
    WHEN plan_type = 'Pro' AND currency = 'GBP' THEN 27.5
    WHEN plan_type = 'Enterprise' AND currency = 'GBP' THEN  141.75 -- Corrected typo from GPB to GBP
    ELSE amount
END;

-- Inspect 'billing' for 'Enterprise' plan in 'INR'
SELECT * from billing
WHERE plan_type = 'Enterprise' AND currency = 'INR';

-- Standardize 'amount' in 'billing' based on 'plan_type' and 'currency' (INR)
UPDATE billing SET amount =  CASE
    WHEN plan_type = 'Basic' AND currency = 'INR' THEN 750
    WHEN plan_type = 'Pro' AND currency = 'INR' THEN 2775
    WHEN plan_type = 'Enterprise' AND currency = 'INR' THEN 14175
    ELSE amount
END;

-- Inspect 'billing' for 'Enterprise' plan in 'EURO'
SELECT * FROM billing
WHERE currency = 'EUR' AND plan_type = 'Enterprise';

SELECT DISTINCT currency FROM billing;

-- Standardize 'amount' in 'billing' based on 'plan_type' and 'currency' (EUR)
UPDATE billing SET amount = CASE
    WHEN plan_type = 'Basic' AND currency = 'EUR' THEN 9.20
    WHEN plan_type = 'Pro' AND currency = 'EUR' THEN 34.04
    WHEN plan_type = 'Enterprise' AND currency = 'EUR' THEN  173.89
    ELSE amount
END;

-- CLEANING CURRENCY COLUMN in 'billing' table

-- Show distinct currency values in the 'billing' table to identify inconsistencies
SELECT DISTINCT currency FROM billing;

-- Standardize 'currency' values in the 'billing' table
UPDATE billing SET currency =
CASE
    WHEN currency IN ('USS','XYZ') THEN 'USD' -- Consolidate variations to 'USD'
    WHEN currency IN ('EURo','EUR') THEN 'EURO' -- Consolidate variations to 'EURO'
    WHEN currency = 'NGNN' THEN 'NGN' -- Correct typo for 'NGN'
    WHEN currency IS NULL THEN 'Unknown' -- Replace NULL with 'Unknown'
    ELSE currency -- Keep other values as they are
END; 

-- Change the data type of the 'amount' column in 'billing' to FLOAT and allow NULLs
ALTER TABLE billing
ALTER COLUMN amount FLOAT NULL;

-- Check for records in 'billing' where amount is still less than or equal to 0 after cleaning
SELECT * FROM billing
WHERE amount <= 0;

-- Retrieve column names and data types for the 'billing' table
SELECT COLUMN_NAME, DATA_TYPE FROM
INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'billing';

-- CHECKING INVALID FOREIGN KEYS

-- Select user_ids from 'support_tickets' that do not exist in the 'users' table (potential orphaned records)
SELECT user_id FROM support_tickets WHERE user_id NOT IN (SELECT user_id FROM users);

-- FEATURE ENGINEERING: SPLITTING 'full_name' into 'first_name' and 'last_name'

-- Add new columns 'first_name' and 'last_name' to the 'users' table
ALTER TABLE users ADD first_name VARCHAR(50), last_name VARCHAR(50);

-- CTE to find the position of the first space and the length of the full_name
WITH CTE AS (
    SELECT
        full_name,
        CHARINDEX(' ',full_name) -1 AS first_space_pos, -- Position of space minus 1 for first name length
        LEN(full_name) AS name_length
    FROM users
)
-- Select the full_name, extracted first_name, and extracted last_name
SELECT
    full_name,
    SUBSTRING(full_name,1,first_space_pos) AS first_name_extracted,
    SUBSTRING(full_name,first_space_pos + 2, name_length - (first_space_pos + 1)) AS last_name_extracted -- Corrected last_name extraction
FROM CTE
WHERE first_space_pos >= 0; -- Ensure there is a space; first_space_pos would be -1 if no space

-- Update 'first_name' column:
-- If a space exists in 'full_name', take the substring before the first space
-- Otherwise (no space), 'first_name' becomes the entire 'full_name'.
UPDATE users SET first_name = CASE
    WHEN CHARINDEX(' ', full_name) > 0
    THEN SUBSTRING(full_name, 1, CHARINDEX(' ', full_name) -1)
    ELSE full_name
END;

SELECT * FROM users;

UPDATE users SET last_name = CASE
    WHEN CHARINDEX(' ', full_name) > 0
    THEN SUBSTRING(full_name,CHARINDEX(' ', full_name) + 1,LEN(full_name))
    ELSE NULL
END;

SELECT * FROM users;

SELECT DISTINCT [plan] FROM subscriptions;

SELECT * FROM subscriptions;

UPDATE subscriptions SET [plan] =
CASE
    WHEN [plan] = 'Basicc' THEN 'Basic'
    WHEN [plan] IN('Enterpris', 'Pro Plus','Bronze') THEN 'Enterprise' -- Consolidating multiple variations to 'Enterprise'
    ELSE [plan] -- Keep other values as they are
END

SELECT * FROM users 
WHERE plan_type = 'Free';

SELECT 
    email,
    UPPER(LEFT(LEFT(email, PATINDEX('%[0-9.@]%', email + '0') - 1), 1)) + 
    LOWER(SUBSTRING(LEFT(email, PATINDEX('%[0-9.@]%', email + '0') - 1), 2, LEN(email)))
    AS cleaned_first_name
FROM users
WHERE first_name IS NULL AND email IS NOT NULL;

SELECT
    email,
    UPPER(LEFT(
        SUBSTRING(email,
                  PATINDEX('%[._]%', email) + 1,
                  NULLIF(CHARINDEX('@', email) - PATINDEX('%[._]%', email) - 1, -1)
        ), 1)
    ) +
    LOWER(SUBSTRING(
        SUBSTRING(email,
                  PATINDEX('%[._]%', email) + 1,
                  NULLIF(CHARINDEX('@', email) - PATINDEX('%[._]%', email) - 1, -1)
        ), 2, 
        100)) AS extracted_last_name
FROM users
WHERE last_name IS NULL 
  AND email IS NOT NULL
  AND PATINDEX('%[._]%', email) > 0
  AND CHARINDEX('@', email) > PATINDEX('%[._]%', email) + 1;

UPDATE users
SET last_name =
    UPPER(LEFT(
        SUBSTRING(email,
                  PATINDEX('%[._]%', email) + 1,
                  CHARINDEX('@', email) - PATINDEX('%[._]%', email) - 1), 1)) +
    LOWER(SUBSTRING(
        SUBSTRING(email,
                  PATINDEX('%[._]%', email) + 1,
                  CHARINDEX('@', email) - PATINDEX('%[._]%', email) - 1), 2, 100))
WHERE last_name IS NULL 
  AND email IS NOT NULL
  AND PATINDEX('%[._]%', email) > 0
  AND CHARINDEX('@', email) > PATINDEX('%[._]%', email) + 1;

UPDATE users
SET first_name = 
    UPPER(LEFT(LEFT(email, PATINDEX('%[0-9.@]%', email + '0') - 1), 1)) + 
    LOWER(SUBSTRING(LEFT(email, PATINDEX('%[0-9.@]%', email + '0') - 1), 2, LEN(email)))
WHERE first_name IS NULL AND email IS NOT NULL;

SELECT * FROM users;