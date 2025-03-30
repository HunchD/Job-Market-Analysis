-- Finding the skills associated with higher salaries

SELECT job_postings_info.job_id, skill_id, salary_year_avg,
        AVG(salary_year_avg) OVER (PARTITION BY skill_id) skill_salary_avg
FROM job_postings_info
JOIN skills_job_info ON job_postings_info.job_id = skills_job_info.job_id
WHERE salary_year_avg IS NOT NULL
ORDER BY skill_id
LIMIT 100;

WITH skill_salary AS
(
    SELECT job_postings_info.job_id, skill_id, salary_year_avg,
            AVG(salary_year_avg) OVER (PARTITION BY skill_id) skill_salary_avg
    FROM job_postings_info
    JOIN skills_job_info ON job_postings_info.job_id = skills_job_info.job_id
    WHERE salary_year_avg IS NOT NULL
)
SELECT DISTINCT skills, ROUND(skill_salary_avg)as salary
FROM skills_info
JOIN skill_salary ON skills_info.skill_id = skill_salary.skill_id
ORDER BY salary DESC;

/* Top-Paying Skills: Debian ($196,500), RingCentral ($182,500), and Mongo ($170,715) are the highest-paying skills, highlighting demand for niche and specialized expertise.

Emerging Technologies: Blockchain (Solidity - $153,640), AI/ML frameworks (PyTorch - $144,470), and Big Data tools (Cassandra - $154,124) are lucrative and reflect modern tech trends.

Programming Languages: High-paying languages include Haskell ($155,758), Scala ($145,120), Rust ($139,349), and Python-related libraries like Pandas ($137,518).

Cloud & DevOps Demand: Skills like AWS ($136,481), Kubernetes ($137,949), and Terraform ($133,161) underscore the importance of cloud computing and infrastructure automation.

Lower-Paying Skills: Foundational tools such as Excel ($99,751) and PowerPoint ($99,160) have lower salaries compared to specialized technical skills. */