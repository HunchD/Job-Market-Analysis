-- Finding the locations that offer the highest average salary as well as the most job opportunities

SELECT job_country, 
       ROUND(AVG(salary_year_avg)) AS avg_salary,
       COUNT(job_country) AS job_count
FROM job_postings_info
WHERE job_country IS NOT NULL 
AND salary_year_avg IS NOT NULL
GROUP BY job_country
HAVING COUNT(job_country) > 10
ORDER BY avg_salary DESC;

/* US Leads in Job Count, but Not Salary: The United States has the highest number of jobs (15,813) with an average salary of $126,018, suggesting a robust job market but not the highest pay.

Sudan's High Average: Sudan shows a surprisingly high average salary ($135,038) with 1,612 jobs, which may indicate a specialized job market or data anomaly requiring further investigation.

Lower Salary Regions: Countries like the Philippines ($83,814), Puerto Rico ($83,013), Taiwan ($82,576), and Turkey ($78,870) have some of the lowest average salaries among those listed, reflecting regional economic disparities.

 */
