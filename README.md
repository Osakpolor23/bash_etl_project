# Building and Automating an ETL Pipeling with Bash Scripting and Cron Scheduler
This project aims to build a simple ETL (Extract, Transform and Load) Pipeline using bash scripting and Linux commands, and then automate it to run at 12 midnight daily using cron scheduler by creating a cron job.

The first few lines of codes first estabished the environment variables for the url that contains the csv file, as well as the directories used throughout the project.

The other parts of the codes was simply broken down into three components: 
**A: Extract** -- Here the csv file was downloaded from the [url](https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv) and saved in the **"raw"** directory, a check was then carried out to confirm if the download was succesful or not.

**B: Transform** -- Here, a column in the file was simply renamed according to the specifics of the task. Then a few columns were selected and saved in the **"Transformed"** directory. A check was also carried out to test for the existence of this file in the Transformed directory.

**C: Load** -- The final output was then copied from the Transformed directory into the **"Gold"** directory. I opted for the copy option instead of moving outrightly because I wanted to keep a version of it in the Transformed folder as well.

Finally, I created a cron job in the crontab by echoing the commands to the crontab directly on the terminal instead of opening an editor such as nano. *The purpose of this cronjob is to run the bash script called *"scripts.sh"* at 12 midnight daily.*

Let me know what you think of the project as well as ways where I can improve it...Regards.