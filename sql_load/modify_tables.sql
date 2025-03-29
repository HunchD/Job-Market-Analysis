LOAD DATA LOCAL INFILE 'C:/Pro/Data Analysis/SQL/Portfolio Project Job Market Analysis/csv_files/company_info.csv'
INTO TABLE company_info
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/Program Files/MYSQL/16/data/Datasets/sql_course/skills_info.csv'
INTO TABLE skills_info
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Load data into job_postings_info table and converting the date format from text to datetime
LOAD DATA INFILE 'C:/Pro/Data Analysis/SQL/Portfolio Project Job Market Analysis/csv_files/job_postings_info.csv'
INTO TABLE job_postings_info
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@job_id, @company_id, @job_title_short, @job_title, @job_location, @job_via, @job_schedule_type, @job_work_from_home, @search_location, @job_posted_date, @job_no_degree_mention, @job_health_insurance, @job_country, @salary_rate, @salary_year_avg, @salary_hour_avg)
SET 
    job_id = @job_id,
    company_id = @company_id,
    job_title_short = @job_title_short,
    job_title = @job_title,
    job_location = @job_location,
    job_via = @job_via,
    job_schedule_type = @job_schedule_type,
    job_work_from_home = @job_work_from_home,
    search_location = @search_location,
    job_posted_date = STR_TO_DATE(@job_posted_date, '%m/%d/%Y %H:%i'),
    job_no_degree_mention = @job_no_degree_mention,
    job_health_insurance = @job_health_insurance,
    job_country = @job_country,
    salary_rate = @salary_rate,
    salary_hour_avg = @salary_hour_avg,
    salary_year_avg = @salary_year_avg;


LOAD DATA INFILE 'C:/Pro/Data Analysis/SQL/Portfolio Project Job Market Analysis/csv_files/skills_job_info.csv'
INTO TABLE skills_job_info
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;