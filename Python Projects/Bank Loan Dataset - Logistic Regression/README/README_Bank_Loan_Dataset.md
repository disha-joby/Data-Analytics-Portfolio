# Bank Loan / Marketing Dataset Analysis

## Project Overview
This project analyses the Bank Loan dataset loaded from `bank-additional-full (3) (1) (2).csv`. The notebook uses customer and campaign-related attributes to prepare a classification workflow with Logistic Regression. The source file is read using a semicolon (`;`) delimiter.

## Tools and Technologies
- Python
- NumPy
- Pandas
- Matplotlib
- Seaborn
- Scikit-learn (`LogisticRegression`, `train_test_split`, `StandardScaler`, `LabelEncoder`, `MinMaxScaler`)
- Scikit-learn metrics (`accuracy_score`, `confusion_matrix`, `precision_score`, `recall_score`, `f1_score`)

## Objectives
- Load and inspect the bank-related dataset.
- Prepare the data for a classification task.
- Transform categorical and numerical features where required.
- Train and evaluate a Logistic Regression classifier.
- Assess model performance using classification metrics.

## Analysis Performed
- Imported the Python libraries required for data handling, visualisation, preprocessing, modelling, and evaluation.
- Loaded the CSV file with `sep=';'` and displayed the dataset.
- The notebook's modelling workflow uses label encoding and feature scaling utilities, followed by a train/test split.
- Logistic Regression is imported as the classification algorithm.
- Accuracy, confusion matrix, precision, recall, and F1-score are imported for model evaluation.

## Key Findings
- The dataset includes customer-related fields such as age, job, marital status, education, default status, housing, and personal loan status.
- The displayed data includes missing entries (`NaN`) and categorical values such as `unknown`, so data cleaning and appropriate encoding are important before modelling.
- The notebook establishes a Logistic Regression classification workflow and the relevant evaluation metrics. No specific accuracy or other final metric is quoted here because a verified final result is not available in the reviewed project summary.

## Conclusion
The project sets up a supervised classification workflow for the bank-related dataset. It highlights the need to handle missing and categorical values before fitting a Logistic Regression model. Evaluating the model with a confusion matrix, accuracy, precision, recall, and F1-score provides a broader view of performance than accuracy alone.
