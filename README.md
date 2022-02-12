# Jobs-Scrapping
Scrap newly posted jobs from a given link and store job attributes to a MySQL database.


******************************
*   Jobs Data Scrapping    *
******************************

->Project Approach:
A timer event envokes a function after every n-seconds(defined in the code) which:
i- fetchs existing maximum job_id from database
ii-scraps the url "https://news.ycombinator.com/jobs",
iii- fetchs only new jobs(based on job_id)from the link
iv- saves it to database

It extracts Position and Company by splitting the Job description
 based on common words used because the library used 'nltk' wasn't
 providing good results, but for Location, I've used 'nltk' to extract it
 from the description.

-> How to deploy
i- create a new database in MySQL named 'scrapping_db' with the following credentials (without quotes):
username:"root"
password:"qamar123" 
ii- import the SQL file present in 'DB' folder.
iii- install the dependencies (Requirements.txt)
iv- run the project and check the output.

->Recomendations:
This project will consume extra processing resources for calculating time passed since last invocation,
so, after removing the timer, this program should be added as scheduled task of OS.
