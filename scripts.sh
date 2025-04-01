## This peoject aim to create an etl pipeline using bash scripting 
## and automate it using cronjob ##

# declare variables
url_csv="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
Raw="./raw"
Transformed="./transformed"
Gold="./Gold"

# Make directories
mkdir -p $Raw $Transformed $Gold # -p flag ensures that parent directories are created if they don't currently exist

# Download the csv file from the url and save in Raw
echo "downloading csv file from the url"
curl -o "$Raw/raw_file.csv" "$url_csv" # -o flag ranames to the output file

# Check if the file is present in the $Raw directory
if [ -f $Raw/raw_file.csv ]; then # The -f flag checks for the existence of a file
    echo "The file '$url_csv' has been successfully downloaded and saved to $Raw directory"
else
    echo "The download process failed"
fi

# Transform:
#Rename the column Variable_code to variable_code and select some columns
sed -i 's/Variable_code/variable_code/g' $Raw/raw_file.csv # The -i renames the columns in place ( -i.bak creates a backup)

# Select the required columns and save in a new file in the Transformed directory
cut -d',' -f1,5,6,9 $Raw/raw_file.csv > $Transformed/2023_year_finance.csv

# Check if the file exists
if [ -f $Transformed/2023_year_finance.csv ]; then 
    echo "The transformed file has been loaded directly to the $Transformed directory"
else
    echo "The load process failed"
fi

# Load:
# Copy the file from the Transformed directory to the Gold directory
cp $Transformed/2023_year_finance.csv $Gold

# Check if the migration was successful or not
if [ -f $Gold/2023_year_finance.csv ]; then 
    echo "The file migration to the $Gold directory was successful"
else
    echo "The migration process failed"
fi

# Automate the pipeline using cron scheduler
# echo "0 0 * * * bash scripts.sh" | crontab  -- This was run on the terminal
# crontab -l --use this to check the existing jobs on the crontab