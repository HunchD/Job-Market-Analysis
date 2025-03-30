-- Calculating the percentage of remote job postings

SELECT COUNT(*) total_jobs,
        (SELECT COUNT(job_id) 
         FROM job_postings_info
         WHERE job_work_from_home = 1) AS remote_job_count,
        (SELECT COUNT(job_id) 
         FROM job_postings_info
         WHERE job_work_from_home = 1) * 100 / COUNT(*) AS remote_job_percentage
FROM job_postings_info;

-- Comparing the average salary for remote and onsite jobs

SELECT
ROUND(AVG(CASE WHEN job_work_from_home = 1 THEN salary_year_avg ELSE NULL END)) AS remote_salary,
ROUND(AVG(CASE WHEN job_work_from_home = 0 THEN salary_year_avg ELSE NULL END)) AS onsite_salary
FROM job_postings_info;

/* 
Remote Work Scarcity: Only 8.8% of jobs are remote, while 91.2% remain in-office or on-site, reflecting a strong preference for traditional work setups.

Remote Work Opportunities: While remote jobs are fewer, they still represent a substantial number (69,606 positions), suggesting opportunities for professionals seeking flexible work setups.

Potential for Growth: The relatively small proportion of remote jobs highlights a potential area for growth as more organizations adopt hybrid or fully remote models.

Remote vs. Onsite Pay: Remote jobs offer a slightly higher average salary ($131,779) compared to onsite jobs ($121,784), indicating a premium for remote work arrangements potentially due to higher demand or the need to attract top talent across geographical boundaries.
*/