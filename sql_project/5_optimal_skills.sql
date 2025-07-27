/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

WITH skill_demand AS (
    SELECT
      sd.skill_id,
      sd.skills,
      COUNT(*) AS skill_count
    FROM job_postings_fact jpf
    JOIN skills_job_dim sjd
      ON jpf.job_id = sjd.job_id
    JOIN skills_dim sd
      ON sd.skill_id = sjd.skill_id
    WHERE
      jpf.job_title_short = 'Data Analyst' AND
      jpf.job_work_from_home = TRUE AND
      jpf.salary_year_avg IS NOT NULL
    GROUP BY
      SD.skill_id
    ORDER BY 
      skill_count DESC),

skill_pay AS (
    SELECT
      sd.skill_id,
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
      sd.skill_id
    ORDER BY
      average_salary DESC)

SELECT
  sd.skills,
  sd.skill_count,
  sp.average_salary
FROM skill_demand sd
JOIN skill_pay sp
  ON sp.skill_id = sd.skill_id
WHERE
  sd.skill_count > 10
ORDER BY
  sp.average_salary DESC,
  sd.skill_count DESC
LIMIT 25;

/*
Here's a breakdown of the most optimal skills for Data Analysts in 2023: 
High-Demand Programming Languages: Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for Python and $100,499 for R, indicating that proficiency in these languages is highly valued but also widely available.
Cloud Tools and Technologies: Skills in specialized technologies such as Snowflake, Azure, AWS, and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
Business Intelligence and Visualization Tools: Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
Database Technologies: The demand for skills in traditional and NoSQL databases (Oracle, SQL Server, NoSQL) with average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval, and management expertise.

[
  {
    "skills": "go",
    "skill_count": "27",
    "average_salary": "115319.89"
  },
  {
    "skills": "confluence",
    "skill_count": "11",
    "average_salary": "114209.91"
  },
  {
    "skills": "hadoop",
    "skill_count": "22",
    "average_salary": "113192.57"
  },
  {
    "skills": "snowflake",
    "skill_count": "37",
    "average_salary": "112947.97"
  },
  {
    "skills": "azure",
    "skill_count": "34",
    "average_salary": "111225.10"
  },
  {
    "skills": "bigquery",
    "skill_count": "13",
    "average_salary": "109653.85"
  },
  {
    "skills": "aws",
    "skill_count": "32",
    "average_salary": "108317.30"
  },
  {
    "skills": "java",
    "skill_count": "17",
    "average_salary": "106906.44"
  },
  {
    "skills": "ssis",
    "skill_count": "12",
    "average_salary": "106683.33"
  },
  {
    "skills": "jira",
    "skill_count": "20",
    "average_salary": "104917.90"
  },
  {
    "skills": "oracle",
    "skill_count": "37",
    "average_salary": "104533.70"
  },
  {
    "skills": "looker",
    "skill_count": "49",
    "average_salary": "103795.30"
  },
  {
    "skills": "nosql",
    "skill_count": "13",
    "average_salary": "101413.73"
  },
  {
    "skills": "python",
    "skill_count": "236",
    "average_salary": "101397.22"
  },
  {
    "skills": "r",
    "skill_count": "148",
    "average_salary": "100498.77"
  },
  {
    "skills": "redshift",
    "skill_count": "16",
    "average_salary": "99936.44"
  },
  {
    "skills": "qlik",
    "skill_count": "13",
    "average_salary": "99630.81"
  },
  {
    "skills": "tableau",
    "skill_count": "230",
    "average_salary": "99287.65"
  },
  {
    "skills": "ssrs",
    "skill_count": "14",
    "average_salary": "99171.43"
  },
  {
    "skills": "spark",
    "skill_count": "13",
    "average_salary": "99076.92"
  },
  {
    "skills": "c++",
    "skill_count": "11",
    "average_salary": "98958.23"
  },
  {
    "skills": "sas",
    "skill_count": "63",
    "average_salary": "98902.37"
  },
  {
    "skills": "sas",
    "skill_count": "63",
    "average_salary": "98902.37"
  },
  {
    "skills": "sql server",
    "skill_count": "35",
    "average_salary": "97785.73"
  },
  {
    "skills": "javascript",
    "skill_count": "20",
    "average_salary": "97587.00"
  }
]
*/