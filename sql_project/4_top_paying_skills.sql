/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    sd.skills,
    ROUND(AVG(jpf.salary_year_avg), 2) AS average_salary
FROM job_postings_fact jpf
JOIN skills_job_dim sjd
    ON sjd.job_id = jpf.job_id
JOIN skills_dim sd
    ON sd.skill_id = sjd.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_work_from_home = TRUE AND
    jpf.salary_year_avg IS NOT NULL
GROUP BY
    sd.skills
ORDER BY
    average_salary DESC
LIMIT 25;

/*
Here's a breakdown of the results for top paying skills for Data Analysts:
- High Demand for Big Data & ML Skills: Top salaries are commanded by analysts skilled in big data technologies (PySpark, Couchbase), machine learning tools (DataRobot, Jupyter), and Python libraries (Pandas, NumPy), reflecting the industry's high valuation of data processing and predictive modeling capabilities.
- Software Development & Deployment Proficiency: Knowledge in development and deployment tools (GitLab, Kubernetes, Airflow) indicates a lucrative crossover between data analysis and engineering, with a premium on skills that facilitate automation and efficient data pipeline management.
- Cloud Computing Expertise: Familiarity with cloud and data engineering tools (Elasticsearch, Databricks, GCP) underscores the growing importance of cloud-based analytics environments, suggesting that cloud proficiency significantly boosts earning potential in data analytics.

[
  {
    "skills": "pyspark",
    "average_salary": "208172.25"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189154.50"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515.00"
  },
  {
    "skills": "watson",
    "average_salary": "160515.00"
  },
  {
    "skills": "datarobot",
    "average_salary": "155485.50"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500.00"
  },
  {
    "skills": "swift",
    "average_salary": "153750.00"
  },
  {
    "skills": "jupyter",
    "average_salary": "152776.50"
  },
  {
    "skills": "pandas",
    "average_salary": "151821.33"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000.00"
  },
  {
    "skills": "golang",
    "average_salary": "145000.00"
  },
  {
    "skills": "numpy",
    "average_salary": "143512.50"
  },
  {
    "skills": "databricks",
    "average_salary": "141906.60"
  },
  {
    "skills": "linux",
    "average_salary": "136507.50"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500.00"
  },
  {
    "skills": "atlassian",
    "average_salary": "131161.80"
  },
  {
    "skills": "twilio",
    "average_salary": "127000.00"
  },
  {
    "skills": "airflow",
    "average_salary": "126103.00"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781.25"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436.33"
  },
  {
    "skills": "notion",
    "average_salary": "125000.00"
  },
  {
    "skills": "scala",
    "average_salary": "124903.00"
  },
  {
    "skills": "postgresql",
    "average_salary": "123878.75"
  },
  {
    "skills": "gcp",
    "average_salary": "122500.00"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619.25"
  }
]
*/