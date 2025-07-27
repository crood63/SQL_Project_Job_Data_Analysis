/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS 
  (SELECT
      j.job_id,
      j.job_title,
      j.job_schedule_type,
      cd.name AS company_name,
      j.salary_year_avg,
      j.job_posted_date
  FROM 
    job_postings_fact j
  LEFT JOIN company_dim cd
    ON j.company_id = cd.company_id
  WHERE
    j.job_title_short = 'Data Analyst' AND
    j.salary_year_avg IS NOT NULL AND
    j.job_location = 'Anywhere'
  ORDER BY
    j.salary_year_avg DESC
  LIMIT 10)

SELECT
  sd.skills,
  COUNT(*) AS skill_count
FROM top_paying_jobs AS tpj
JOIN skills_job_dim AS sjd
  ON sjd.job_id = tpj.job_id
JOIN skills_dim AS sd
  ON sd.skill_id = sjd.skill_id
GROUP BY
  sd.skills
ORDER BY
  skill_count DESC;


/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.

[
  {
    "skills": "sql",
    "skill_count": "8"
  },
  {
    "skills": "python",
    "skill_count": "7"
  },
  {
    "skills": "tableau",
    "skill_count": "6"
  },
  {
    "skills": "r",
    "skill_count": "4"
  },
  {
    "skills": "snowflake",
    "skill_count": "3"
  },
  {
    "skills": "pandas",
    "skill_count": "3"
  },
  {
    "skills": "excel",
    "skill_count": "3"
  },
  {
    "skills": "atlassian",
    "skill_count": "2"
  },
  {
    "skills": "jira",
    "skill_count": "2"
  },
  {
    "skills": "aws",
    "skill_count": "2"
  },
  {
    "skills": "azure",
    "skill_count": "2"
  },
  {
    "skills": "bitbucket",
    "skill_count": "2"
  },
  {
    "skills": "confluence",
    "skill_count": "2"
  },
  {
    "skills": "gitlab",
    "skill_count": "2"
  },
  {
    "skills": "go",
    "skill_count": "2"
  },
  {
    "skills": "numpy",
    "skill_count": "2"
  },
  {
    "skills": "oracle",
    "skill_count": "2"
  },
  {
    "skills": "power bi",
    "skill_count": "2"
  },
  {
    "skills": "jenkins",
    "skill_count": "1"
  },
  {
    "skills": "crystal",
    "skill_count": "1"
  },
  {
    "skills": "powerpoint",
    "skill_count": "1"
  },
  {
    "skills": "pyspark",
    "skill_count": "1"
  },
  {
    "skills": "hadoop",
    "skill_count": "1"
  },
  {
    "skills": "git",
    "skill_count": "1"
  },
  {
    "skills": "sap",
    "skill_count": "1"
  },
  {
    "skills": "jupyter",
    "skill_count": "1"
  },
  {
    "skills": "flow",
    "skill_count": "1"
  },
  {
    "skills": "databricks",
    "skill_count": "1"
  }
]

*/