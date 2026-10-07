-- Day 2: RBAC setup (custom roles)
USE ROLE SECURITYADMIN;

CREATE ROLE IF NOT EXISTS data_engineer;
CREATE ROLE IF NOT EXISTS data_analyst;

-- Build the hierarchy: analyst -> engineer -> SYSADMIN
GRANT ROLE data_analyst TO ROLE data_engineer;
GRANT ROLE data_engineer TO ROLE SYSADMIN;

-- Give the analyst role access to the bronze layer
USE ROLE SYSADMIN;
GRANT USAGE ON DATABASE retail_lakehouse TO ROLE data_analyst;
GRANT USAGE ON SCHEMA retail_lakehouse.bronze TO ROLE data_analyst;
GRANT SELECT ON ALL TABLES IN SCHEMA retail_lakehouse.bronze TO ROLE data_analyst;
GRANT SELECT ON FUTURE TABLES IN SCHEMA retail_lakehouse.bronze TO ROLE data_analyst;
