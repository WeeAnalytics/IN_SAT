# Indiana SAT score analysis - SQL

A similar project on the analysis of New York City public schools' test result score was suggested by Datacamp.com. The SAT (Scholastic Assessment Test) results used to find out high school performances across the state. Since I live in the state of Indiana and I have a child in elementary school, I am curious to find out what the perfomances are in my home state. 

The questions that I had are:
1. Which are the schools with missing SAT scores?
2. Which are the top 3 schools in terms of composite SAT scores?
3. Which are the top 3 schools in SAT math score?
4. Which are the top 3 schools in SAT reading score?

## About the project:

I obtained my data from https://www.in.gov/doe/it/data-center-and-reports/ and saved it as `IN_SAT.csv`. 

A table called `school` is created to store the dataset as follows:

```
    year                     VARCHAR
    corp_id                  VARCHAR
    corp_name                VARCHAR 
    school_id                VARCHAR
    school_name              VARCHAR
    num_took_sat             INT
    num_grad                 INT
    percent_grad_taking_sat  DECIMAL(5,2)
    avg_composite            FLOAT
    ave_sat_math             FLOAT
    ave_sat_reading          FLOAT
```
A quick glance into the csv file shows that `***` was used to represent NULL value. When loading the csv file into the SQL table, I make sure that any field that contains `***` are changed to NULL. 

A couple of changes are made to the data:

1. `year` column
Values in the `year` column are shown as e.g.2017-18, to represent the school year of 2017 to 2018. I changed it to just show the first half of the school year.

2. `percent_grad_taking_sat` column
The values in this column are divided by 100 to reflect the percentages in decimals.

SQL syntax used :
`ROW_NUMBER()` is used to rank the top 3 schools based on composite, math and reading score for each year. 
