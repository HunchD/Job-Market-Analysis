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

/* Remote Jobs are Limited: Only 8.8% of total jobs are remote, indicating that most positions require in-office or on-site work.

Non-Remote Jobs Dominate: A significant 91.2% of jobs are non-remote, showing a preference for traditional work arrangements across industries.

Remote Work Opportunities: While remote jobs are fewer, they still represent a substantial number (69,606 positions), suggesting opportunities for professionals seeking flexible work setups.

Potential for Growth: The relatively small proportion of remote jobs highlights a potential area for growth as more organizations adopt hybrid or fully remote models.

Industry Trends: The dominance of non-remote jobs could reflect industry-specific requirements, such as roles in manufacturing, healthcare, or other sectors where physical presence is essential. 

Remote vs. Onsite Pay: Remote jobs offer a slightly higher average salary ($131,779) compared to onsite jobs ($121,784), indicating a premium for remote work arrangements potentially due to higher demand or the need to attract top talent across geographical boundaries.*/