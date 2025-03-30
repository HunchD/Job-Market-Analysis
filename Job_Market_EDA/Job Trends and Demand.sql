-- Finding the top 3 job titles with the highest demand in the job market

SELECT job_title_short, COUNT(job_id) AS job_title_count
FROM job_postings_info
GROUP BY job_title_short
ORDER BY job_title_count DESC;



-- Finding the top skills that are required for these roles
WITH top_job_titles AS (
    SELECT job_title_short
    FROM job_postings_info
    GROUP BY job_title_short
    ORDER BY COUNT(job_id) DESC
    LIMIT 3
),
top_job_title_id AS 
(
    SELECT job_id, job_title_short
    FROM job_postings_info
    WHERE job_title_short IN 
    (
        SELECT job_title_short
        FROM top_job_titles
    )
)
SELECT job_title_short, skills, COUNT(skills_info.skill_id) skill_count
FROM top_job_title_id
JOIN skills_job_info ON top_job_title_id.job_id = skills_job_info.job_id
JOiN skills_info ON skills_job_info.skill_id = skills_info.skill_id
GROUP BY job_title_short, skills
ORDER BY job_title_short, skill_count DESC;


/* 
Python and SQL are the most in-demand skills, with a significantly higher number of job postings compared to others.

Excel remains essential, particularly for analyst roles.

Machine Learning and Spark are notably sought after, reflecting the growing emphasis on AI and big data technologies.

Skills like Tableau and Power BI indicate the demand for data visualization and business intelligence tools. 
*/