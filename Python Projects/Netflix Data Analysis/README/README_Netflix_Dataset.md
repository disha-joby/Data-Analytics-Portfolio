# Netflix Dataset – Movie Ratings and Recommendation Analysis



## Project Overview

This project explores the Netflix movie-rating dataset to understand customer rating behaviour, identify highly rated movie genres, and build a personalised movie recommendation model. The analysis uses customer ratings and movie metadata, then applies Singular Value Decomposition (SVD) to estimate ratings for a sample customer.

The source data is a large ratings file containing movie identifiers and customer ratings, together with a separate movie metadata file containing movie titles and genres.



## Tools and Technologies

* **Python**
* **Google Colab** – notebook environment and Google Drive access
* **NumPy** – numerical operations and percentile calculations
* **Pandas** – data loading, cleaning, grouping, filtering, and merging
* **Matplotlib and Seaborn** – imported for visualisation
* **Scikit-Surprise** – collaborative-filtering model using SVD



## Objectives

* Examine the structure and quality of the Netflix ratings data.
* Identify movie records and customer ratings from the source-file format.
* Measure rating activity across movies and customers.
* Filter movies and customers with relatively few ratings using percentile-based thresholds.
* Evaluate an SVD collaborative-filtering model.
* Compare average ratings across movie genres.
* Generate personalised movie recommendations for an example customer.



## Analysis Performed

### 1\. Data Loading and Initial Inspection

* Loaded the ratings file into a Pandas DataFrame with `CustId` and `Rating` columns.
* Inspected the first records, dataset dimensions, and missing values.
* Identified **24,058,263 rows** in the original ratings file.
* Found **4,499 missing values** in the `Rating` column. These rows represent movie-header records in the source-file structure rather than customer rating observations.



### 2\. Movie and Customer Identification

* Counted **4,499 movies** using the missing-rating/header rows.
* Identified **470,758 customers**.
* Counted **24,053,764 customer rating records**.
* Extracted the current movie ID from the movie-header rows and assigned it to the associated customer-rating records.
* Removed the movie-header rows after assigning movie IDs and converted customer IDs to integers.



### 3\. Rating Distribution

The distribution of customer ratings was examined:

|Rating|Number of ratings|
|-:|-:|
|1|1,118,186|
|2|2,439,073|
|3|6,904,181|
|4|8,085,741|
|5|5,506,583|

Rating 4 was the most frequently recorded score, followed by ratings 3 and 5.



### 4\. Filtering Movies and Customers

* Calculated the number of ratings received by each movie.
* Used the 60th percentile of movie rating counts as a benchmark: **908 ratings**.
* Identified **2,699 movies** below that benchmark for removal from the modelling dataset.
* Calculated the number of ratings submitted by each customer.
* Used the 60th percentile of customer rating counts as a benchmark: **36 ratings**.
* Identified **282,042 customers** below that benchmark for removal.
* After applying both filters, the dataset contained **19,695,836 rating records**.



### 5\. Movie Metadata and Dataset Integration

* Loaded the movie metadata file containing movie IDs, titles, and genres.
* Joined the filtered ratings with movie metadata using the movie ID.
* Split multi-genre values into individual genres so that ratings could be grouped by genre.



### 6\. Collaborative Filtering with SVD

* Used Scikit-Surprise to prepare the customer–movie–rating data.
* Trained an SVD model on the first **100,000 rating records** from the filtered dataset.
* Evaluated the model using **3-fold cross-validation** and RMSE.

Cross-validation RMSE values:

* Fold 1: **1.0178**
* Fold 2: **1.0192**
* Fold 3: **1.0205**
* Average RMSE: approximately **1.019**

The RMSE represents the typical size of the model's rating prediction error on the cross-validation folds; lower values indicate more accurate predictions.



### 7\. Genre Rating Analysis

Calculated the average movie rating for each genre after splitting multi-genre records.

* **Highest average-rated genre:** IMAX – approximately **3.705**
* **Lowest average-rated genre:** Film-Noir – approximately **3.387**

Other highly rated genres in the output included Adventure, Musical, and Children.



### 8\. Personalised Movie Recommendations

* Selected customer ID **1331154** as an example.
* Retrieved this customer's existing rating history, containing **253 ratings**.
* Generated estimated ratings for eligible movies using the trained SVD model.
* Sorted movies by estimated score to identify the highest-scoring suggestions.

The top suggestions in the notebook included:

* *Father of the Bride Part II (1995)* – estimated score **4.537**
* *Leaving Las Vegas (1995)* – estimated score **4.182**
* *Persuasion (1995)* – estimated score **4.016**

These are model predictions for the selected example customer, not actual ratings or universal recommendations.



## Key Findings

* The original file contained more than **24 million rows**, including movie-header rows and customer rating records.
* There were **470,758 customers**, **4,499 movies**, and **24,053,764 customer ratings** identified in the source data.
* Rating 4 was the most common rating, with over **8 million** records.
* The percentile-based filtering reduced the modelling dataset to **19,695,836 ratings**.
* The SVD model achieved an average cross-validation RMSE of approximately **1.019** on the selected 100,000-record modelling sample.
* IMAX had the highest average genre rating in the analysis, while Film-Noir had the lowest.
* The model produced individual movie suggestions for the example customer based on estimated ratings.



## Conclusion

This project demonstrates how a large-scale movie-rating dataset can be prepared and analysed to understand customer preferences and support personalised recommendations. The SVD collaborative-filtering model provides estimated movie ratings, while genre-level averages offer a broader view of rating patterns.

The recommendation model was evaluated on a 100,000-record sample rather than the entire filtered dataset. Its predictions should therefore be interpreted as an analytical demonstration, not as a production-ready Netflix recommendation system.

