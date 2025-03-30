-- Comparing the average salary of job postings that require a degree vs those that don't

SELECT
ROUND(AVG(CASE WHEN job_no_degree_mention = 1 THEN salary_year_avg ELSE NULL END)) AS salary_norequirements,
ROUND(AVG(CASE WHEN job_no_degree_mention = 0 THEN salary_year_avg ELSE NULL END)) AS salary_requirements
FROM job_postings_info;

-- Higher Salary for Jobs with Requirements: Jobs that require a degree or specific qualifications offer an average salary of $125,026, which is approximately 10% higher than jobs without requirements ($113,645). This indicates that educational or skill-based qualifications tend to lead to higher-paying roles.