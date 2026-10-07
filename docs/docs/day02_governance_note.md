# Day 2: Governance Note

- Roles control access in Snowflake. ACCOUNTADMIN is at the top, and PUBLIC is given to everyone.
- I created custom roles `data_engineer` and `data_analyst` and linked them in a hierarchy.
- I used `GRANT SELECT ON FUTURE TABLES` so new tables in the bronze schema are readable automatically.
- I created a masking policy (`email_mask`) so only privileged roles see real values.
