-- LEFT JOIN:
SELECT COUNT(*)
FROM job_postings_fact

SELECT jpf.*, cd.*
FROM job_postings_fact AS jpf
LEFT JOIN company_dim as cd
    ON jpf.company_id = cd.company_id 
LIMIT 10;

SELECT jpf.job_id, jpf.job_title_short,jpf.job_location, cd.company_id, cd.name AS company_name
FROM job_postings_fact AS jpf
LEFT JOIN company_dim as cd
    ON jpf.company_id = cd.company_id 
LIMIT 10;

-- RIGHT JOIN:
SELECT jpf.job_id, jpf.job_title_short,jpf.job_location, cd.company_id, cd.name AS company_name
FROM job_postings_fact AS jpf
RIGHT JOIN company_dim as cd
    ON jpf.company_id = cd.company_id 
LIMIT 10;

-- INNER JOIN:
SELECT jpf.job_id, jpf.job_title_short,jpf.job_location, cd.company_id, cd.name AS company_name
FROM job_postings_fact AS jpf
INNER JOIN company_dim as cd
    ON jpf.company_id = cd.company_id 
LIMIT 10;

-- FULL OUTER JOIN/ FULL JOIN:
SELECT jpf.job_id, jpf.job_title_short,jpf.job_location, cd.company_id, cd.name AS company_name
FROM job_postings_fact AS jpf
FULL OUTER JOIN company_dim as cd  -- We can also use FULL JOIN instead of FULL OUTER JOIN
    ON jpf.company_id = cd.company_id;

-- FULL JOINS with Skills table:
SELECT *
FROM skills_job_dim
LIMIT 10;

SELECT *
FROM skills_dim
LIMIT 10;

SELECT jpf.job_id,
jpf.job_title_short,
sjd.skill_id,
sd.skills
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
LEFT JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id;

--INNER JOIN with skills table
SELECT jpf.job_id,
jpf.job_title_short,
sjd.skill_id,
sd.skills
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id;