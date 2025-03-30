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

Canada, Australia & Europe: Canada ($123,228), Australia ($118,391) show moderate high average salaries while other European countries such as UK ($109,844), Germany ($115,801), France ($105,211) and smaller countries also have attractive salaries.

Lower Salary Regions: Countries like the Philippines ($83,814), Puerto Rico ($83,013), Taiwan ($82,576), and Turkey ($78,870) have some of the lowest average salaries among those listed, reflecting regional economic disparities.

Bahamas as a High-Salary Outlier: The Bahamas has the highest average salary ($201,512) but with a relatively low job count (21), suggesting a highly specialized and well-compensated job sector, possibly related to finance or tourism. */
