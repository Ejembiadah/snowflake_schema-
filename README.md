# snowflake_schema-

This project contains a Snowflake Schema built in PostgreSQL to demonstrate database design and normalization for efficient querying and reporting. The schema is based on a movie rental system and includes 15 interconnected tables.

### Steps in the Project
- Download CSV files of a movie rental system from [Kaggle](https://www.kaggle.com/)
- Create **independent (dimension) tables**.
- Create **dependent (fact) tables** with foreign keys referencing the primary keys of the related tables.
- Import downloaded data

### Technologies Used
- **PostgreSQL** (database system)  
- **DBeaver** (database management & ERD tool)

### How to query this script.

1. Download DBeaver:  
   - **https://dbeaver.io/download/**  
2. Open DBeaver and connect to PostgreSQL:  
   - Click **Database** → **New Database Connection**.  
   - Select **PostgreSQL** from the list of databases.  
   - Enter your connection details (host, port, database name, username, and password).  
   - Click **Test Connection** → **Finish**.  
3. Open a new SQL Editor window and run the script.
   
