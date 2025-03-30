
-- To identify the top paying job roles based on average salary
SELECT job_title_short, ROUND(AvG(salary_year_avg)) avg_salary
FROM job_postings_info
GROUP BY job_title_short
ORDER BY avg_salary DESC;


-- Finding the company that offers the highest salary for each job title


WITH salary_table AS 
(
    SELECT job_id, job_title_short, company_id, salary_year_avg,
        Rank() OVER (PARTITION BY job_title_short ORDER BY salary_year_avg DESC) AS salary_rank
    FROM job_postings_info
),
ranked_salary AS 
(
    SELECT company_id, job_title_short, salary_year_avg, salary_rank
    FROM salary_table
    WHERE salary_rank = 1
    ORDER BY salary_year_avg DESC
)
SELECT company_info.name, job_title_short, salary_year_avg
FROM ranked_salary
JOIN company_info ON ranked_salary.company_id = company_info.company_id
ORDER BY salary_year_avg DESC;

/* 
Salary Progression: Salaries increase significantly with seniority and specialization, with senior data roles earning up to $154,050.

Data and AI Demand: Data Scientists ($135,929) and Machine Learning Engineers ($126,786) command high salaries, reflecting strong demand for AI expertise.

Cloud Specialization: Cloud Engineers ($111,268) are well-compensated, emphasizing the growing reliance on cloud infrastructure.

Seniority Premium: Transitioning from mid-level to senior roles results in substantial salary jumps, often exceeding $20,000.

Career Growth Opportunities: Analysts can significantly increase their earnings by upskilling in data engineering, machine learning, or cloud technologies.
 */