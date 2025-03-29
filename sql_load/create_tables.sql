-- Create company_info table with primary key
CREATE TABLE company_info (
    company_id INT PRIMARY KEY,
    name TEXT,
    link TEXT,
    link_google TEXT,
    thumbnail TEXT
);

-- Create skills_info table with primary key
CREATE TABLE skills_info (
    skill_id INT PRIMARY KEY,
    skills TEXT,
    type TEXT
);

-- Create job_postings_info table with primary key
CREATE TABLE job_postings_info (
    job_id INT PRIMARY KEY,
    company_id INT,
    job_title_short VARCHAR(255),
    job_title TEXT,
    job_location TEXT,
    job_via TEXT,
    job_schedule_type TEXT,
    job_work_from_home BOOLEAN,
    search_location TEXT,
    job_posted_date DATETIME,
    job_no_degree_mention BOOLEAN,
    job_health_insurance BOOLEAN,
    job_country TEXT,
    salary_rate TEXT,
    salary_year_avg DECIMAL(10, 2),
    salary_hour_avg DECIMAL(10, 2),
    FOREIGN KEY (company_id) REFERENCES company_info (company_id)
);

-- Create skills_job_info table with a composite primary key and foreign keys
CREATE TABLE skills_job_info (
    job_id INT,
    skill_id INT,
    PRIMARY KEY (job_id, skill_id),
    FOREIGN KEY (job_id) REFERENCES job_postings_info (job_id),
    FOREIGN KEY (skill_id) REFERENCES skills_info (skill_id)
);

-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_company_id ON job_postings_info (company_id);
CREATE INDEX idx_skill_id ON skills_job_info (skill_id);
CREATE INDEX idx_job_id ON skills_job_info (job_id);

