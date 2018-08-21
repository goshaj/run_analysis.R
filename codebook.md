Data has been obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In order to follow transformations in run_analysis.R, working directory must first be set to the folder containing the folder named "data" in which the unzipped folder extracted from the above link is.

Transformations proceeded as follows:
1. Training and Test sets were merged to create a single dataset.
2. Mean (mean) and Standard Devation (std) measures were extracted.
3. Activity names column was added and labeled.
4. Subject column was added and means were calculated.
5. New, Tidy dataset was created where the means were saved.
