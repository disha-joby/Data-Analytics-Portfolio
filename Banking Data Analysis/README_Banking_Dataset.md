# Bank Marketing Data Analysis Using Python and SQL



## Project Overview

This project analyses a bank marketing dataset to explore customer characteristics, account balances, loan information and the outcomes of direct marketing campaigns. The objective is to understand which customer and campaign-related factors are associated with subscribing to a term deposit. The dataset contains **45,211 records and 17 columns**. The target variable is `y`, which indicates whether a customer subscribed to a term deposit (`yes` or `no`).



## Tools and Technologies

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* SciPy
* Scikit-learn
* SQL Server
* SQL Server Management Studio (SSMS)
* Google Colab



## Objectives

* Understand the structure and characteristics of the bank marketing dataset.
* Inspect data quality, including missing values, duplicates and categorical values.
* Explore customer demographics, account balances and loan information.
* Examine relationships between campaign activity and term-deposit subscription.
* Apply statistical tests to investigate differences between customer groups.
* Build and evaluate a machine learning classification model.
* Use SQL queries and database objects to analyse and organise the data.



## Analysis Performed

### Python Analysis

* Data inspection and cleaning, including checking data types, missing values, duplicates and categorical values.
* Exploratory Data Analysis (EDA) of customer age, job, marital status and education.
* Analysis of housing loans and personal loans.
* Examination of campaign contacts and subscription outcomes.
* Statistical analysis of account balances for customers with and without housing loans using Welch's independent t-test and the Mann--Whitney U test.
* Correlation analysis involving campaign-related numerical variables, including call duration and number of campaign contacts.
* Classification of term-deposit subscription using a Random Forest model.
* Model evaluation using accuracy, precision, recall, ROC-AUC, a classification report and a confusion matrix.



### SQL Analysis

* Retrieved and inspected records and calculated the total number of clients.
* Identified the top five job categories by average account balance.
* Compared term-deposit subscription success rates across education groups.
* Created a client summary view (`vw\_ClientSummary`) with customer and loan information.
* Created a campaign performance view (`vw\_CampaignPerformance`) summarising monthly contacts and subscription success rates.
* Created indexes on the `age`, `job` and `marital` columns.
* Demonstrated a balance-update stored procedure using separate sample `Clients` and `TransactionHistory` tables.



> \*\*Note:\*\* The original bank marketing dataset does not contain transaction-history records. The `Clients` and `TransactionHistory` tables were created with sample data solely to demonstrate how a stored procedure can update customer balances. They are separate from the original bank dataset.



## Key Findings

* The dataset contains **45,211 customer records** and **17 variables**, with `y` representing the term-deposit subscription outcome.
* The analysis found a statistically significant difference in average account balances between customers with and without housing loans. The average balance was approximately **1,175.10** for customers with a housing loan and **1,596.50** for customers without one. Welch's t-test returned a p-value of approximately **6.63 × 10⁻⁴⁵**; the Mann--Whitney U test also returned a very small p-value (approximately **8.96 × 10⁻⁴⁸**).
* The Python workflow also examines how customer characteristics and campaign-related variables relate to subscription outcomes.
* The Random Forest workflow evaluates subscription prediction, but model performance values should be added here after running the final notebook and confirming its output.
* The SQL views provide reusable summaries of customer loan information and monthly campaign performance.



## Conclusion

This project combines exploratory analysis, statistical testing, machine learning and SQL querying to examine bank marketing data. The findings show that customer account balances differ significantly according to housing-loan status, while the wider analysis provides a way to explore customer profiles and campaign outcomes. These insights can support more informed customer segmentation and campaign planning. The classification workflow can also be used to assess whether customer and campaign information helps predict term-deposit subscriptions. The sample transaction tables demonstrate a separate SQL stored-procedure concept and should not be interpreted as actual transaction data from the original dataset.

