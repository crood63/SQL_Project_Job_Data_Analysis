/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT
  sd.skills,
  COUNT(*) AS skill_count
FROM job_postings_fact jpf
JOIN skills_job_dim sjd
  ON jpf.job_id = sjd.job_id
JOIN skills_dim sd
  ON sd.skill_id = sjd.skill_id
WHERE
  jpf.job_title_short = 'Data Analyst' AND
  jpf.job_work_from_home = TRUE
GROUP BY
  SD.skills
ORDER BY 
  skill_count DESC
LIMIT 5

/*
Here's the breakdown of the most demanded skills for data analysts in 2023
SQL and Excel remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
Programming and Visualization Tools like Python, Tableau, and Power BI are essential, pointing towards the increasing importance of 
technical skills in data storytelling and decision support.

[
  {
    "skills": "sql",
    "skill_count": "7291"
  },
  {
    "skills": "excel",
    "skill_count": "4611"
  },
  {
    "skills": "python",
    "skill_count": "4330"
  },
  {
    "skills": "tableau",
    "skill_count": "3745"
  },
  {
    "skills": "power bi",
    "skill_count": "2609"
  }
]
*/