-- create a table for SAT results
CREATE TABLE school(
    year                     VARCHAR,
    corp_id                  VARCHAR,
    corp_name                VARCHAR, 
    school_id                VARCHAR,
    school_name              VARCHAR,
    num_took_sat             INT,
    num_grad                 INT,
    percent_grad_taking_sat  DECIMAL(5,2),
    avg_composite            FLOAT,
    ave_sat_math             FLOAT,
    ave_sat_reading          FLOAT
);

-- loading data into the school table
COPY school
FROM '/mnt/c/Users/kyoto/OneDrive/Documents/Indiana_SAT_SQL/IN_SAT.csv'
WITH DELIMITER ',' CSV HEADER NULL '***';

select * FROM school;

