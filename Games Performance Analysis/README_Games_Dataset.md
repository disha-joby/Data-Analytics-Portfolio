# Video Game Data Analysis Using Python and SQL



## Project Overview

This project analyses a video game dataset to explore game releases, genres, platforms and user ratings. It combines exploratory data analysis, time-series forecasting, statistical hypothesis testing and SQL queries to identify patterns in the dataset. The dataset contains **5,000 records** and includes game names, genres, platforms, release years and user ratings.



## Tools and Technologies

* Python
* Pandas
* NumPy
* Matplotlib
* SciPy
* Statsmodels
* SQL Server
* SQL Server Management Studio (SSMS)
* Google Colab



## Objectives

* Understand the structure and characteristics of the games dataset.
* Check data quality, including missing values, duplicates and rating ranges.
* Explore the distribution of games across genres and platforms.
* Analyse game releases and average user ratings over time.
* Forecast future game-release counts using a time-series model.
* Test whether user ratings differ significantly across platforms.
* Examine relationships between release year, genre, platform and user ratings.
* Use SQL to query, categorise and organise game-rating information.



## Analysis Performed

### Python Analysis

* Data inspection and validation.
* Checked for missing values and duplicate records.
* Checked that user ratings fall within the expected 0--10 range.
* Reviewed the distribution of games by genre and platform.
* Created a `Decade` feature from the `Release Year` column.
* Exploratory visualisations of game counts by genre, platform and release year.
* Compared average user ratings by genre and platform.
* Aggregated annual game releases and average ratings.
* Performed time-series forecasting of annual game releases using an **ARIMA(1, 1, 1)** model, including a five-year forecast.
* Conducted a one-way ANOVA test to investigate whether average user ratings differ across platforms.
* Performed correlation analysis between `Release Year` and `User Rating`.



### SQL Analysis

* Retrieved records from the `games\\\_dataset` table.
* Identified the top five platforms by average user rating.
* Used a common table expression (CTE) to identify genres with an average user rating above 5.6.
* Added a `Rating\\\_Category` column to classify ratings as `High`, `Medium` or `Low`.
* Created and executed the `UpdateGameRatings` stored procedure to populate rating categories.
* Created a trigger (`SetDefaultUserRating`) to assign a default rating of 5.0 when a newly inserted record has a null user rating.
* Created a view (`vw\\\_CompleteGameRatings`) containing records with the required game, genre, platform, release-year and rating fields.



## Key Findings

* The dataset contains **5,000 records**, covering release years from **2000 to 2023**.
* The dataset has no missing values or duplicate records in the checks performed. User ratings were also within the checked 0--10 range.
* The data includes **14 game genres** and **5 platforms**. PC has the largest number of records among the platforms, with **1,056 games**.
* The correlation between release year and user rating is approximately **0.000177**, indicating virtually no linear relationship between these two variables in this dataset.
* The one-way ANOVA test returned an F-statistic of approximately **0.4702** and a p-value of approximately **0.7577**. At the 0.05 significance level, the analysis failed to reject the null hypothesis; it did not find a statistically significant difference in average user ratings across platforms.
* The ARIMA model generated a five-year forecast for annual game releases. Its predicted values are approximately **206 games per year** for 2024--2028. These are model forecasts, not observed release counts.
* The SQL analysis adds a rating-category workflow and provides a view for accessing complete game-rating records.



## Conclusion

This project uses Python and SQL to examine trends and patterns in video game data. The analysis covers the distribution of games across genres and platforms, user-rating comparisons, statistical testing and forecasting of annual game releases. The results suggest that release year has almost no linear relationship with user rating in this dataset, and the ANOVA test did not identify a statistically significant difference in average ratings between platforms.



The ARIMA forecast provides an estimated continuation of annual release counts, while the SQL procedures, trigger and view demonstrate ways to manage and query rating information. These techniques can support further exploration of game catalogues, platform-level rating patterns and release trends. The forecasts and statistical conclusions should be interpreted in the context of the dataset and the assumptions of the methods used.

