# Insurance Claim Amount Analysis

## Project Overview
This project analyses an insurance dataset containing customer and policy-related attributes, including age, sex, BMI, number of children, smoking status, claim amount, and past consultations. The notebook imports Linear Regression to model a numerical outcome using the available features.

## Tools and Technologies
- Python
- NumPy
- Pandas
- Matplotlib
- Seaborn
- Scikit-learn (`LinearRegression`, `train_test_split`)
- Scikit-learn metrics (`mean_squared_error`, `r2_score`)

## Objectives
- Explore the insurance dataset and its variables.
- Examine relationships between customer characteristics and insurance claim amounts.
- Prepare the data for a regression task.
- Train a Linear Regression model.
- Evaluate predictions using regression metrics.

## Analysis Performed
- Imported libraries for data manipulation, visualisation, model training, and evaluation.
- Loaded `insurance_data.csv` into a Pandas DataFrame.
- Inspected the dataset, including fields such as age, sex, BMI, children, smoker, `Claim_Amount`, and `past_consultations`.
- Set up a regression workflow using a train/test split and Linear Regression.
- Imported Mean Squared Error and R-squared to evaluate model predictions.

## Key Findings
- The displayed dataset contains customer attributes alongside a numerical `Claim_Amount` field, making it suitable for a regression approach.
- Smoking status, BMI, age, number of children, and past consultations are among the available explanatory variables.
- The notebook imports Linear Regression and the relevant regression evaluation metrics. A final MSE or R-squared value is not stated here because a verified final result is not available in the reviewed project summary.

## Conclusion
The project uses regression techniques to explore and predict insurance claim amounts from customer-related information. Linear Regression provides a baseline modelling approach, while Mean Squared Error and R-squared can be used to assess prediction error and model fit.
